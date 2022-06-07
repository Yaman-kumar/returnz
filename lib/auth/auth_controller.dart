import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:returnz/app/modules/login/views/otp/verify_otp.dart';
import 'package:returnz/app/modules/verify_otp/views/verify_otp_view.dart';
import 'package:returnz/app/routes/app_pages.dart';

class authController extends GetxController {
  late GoogleSignIn googleSign;
  final errorText = ''.obs;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //Loader
  final LoginLoader = false.obs;
  final loader = false.obs;
  final ResetLoader = false.obs;
  final Phoneloader = false.obs;

  @override
  void onInit() async {
    print("AuthController");
    super.onInit();
    googleSign = GoogleSignIn();
  }

  //Register User with Email and password
  Future<User?> registerUsingEmailPassword({
    //required String name,
    required String email,
    required String password,
  }) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      loader.value = true;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      //await user!.updateProfile(displayName: name);
      //await user.reload();
      user = auth.currentUser;
      loader.value = false;
      user?.sendEmailVerification();
      if (user != null) {
      Get.toNamed(Routes.VERIFY_OTP);
      }
    } on FirebaseAuthException catch (e) {
      loader.value = false;
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        errorText.value = 'The password provided is too weak.';
        Get.snackbar("Error", errorText.value,
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        errorText.value = 'The account already exists for that email.';
        Get.snackbar("Error", errorText.value,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      loader.value = false;

      print(e);
      Get.snackbar("Error", "${e}", snackPosition: SnackPosition.BOTTOM);
    }
    loader.value = false;

    return user;
  }



//login firebase
  void login(String email, String password) async {
    LoginLoader.value = true;
    try {
      User? user;
      LoginLoader.value = true;
      UserCredential userCredential =  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);


      LoginLoader.value = false;
      user =userCredential.user;
      if(user != null){
        Get.toNamed(Routes.LOCALAUTH);

      }
     // Get.toNamed(Routes.NAVBAR);
    } on FirebaseAuthException catch (e) {
      LoginLoader.value = false;
      print(e.code);
      if (e.code == 'unknown') {
        // Get.snackbar(
        //   "Error",
        //   "${e.code}",
        // );
      } else {
        Get.snackbar(
          "Error",
          "${e.code}",
        );
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error", "${e}");
      LoginLoader.value = false;
    }
    LoginLoader.value = false;
  }

//Google Login
  void googleLogin() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();
      if (googleSignInAccount == null) {
      } else {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        print("Token : ${googleSignInAuthentication.accessToken}");
        await firebaseAuth.signInWithCredential(oAuthCredential);
        print(
            "${oAuthCredential} ${googleSignInAccount.displayName.toString()} ${googleSignInAccount.email.toString()} ${googleSignInAccount.photoUrl.toString()}");

       // Get.offAndToNamed(Routes.NAVBAR);
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "${e}");
    }
  }

//Facebook
  signInWithFacebook() async {
    final LoginResult result =
    await FacebookAuth.instance.login(permissions: ['email']);
    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      print("User Data  ===  ${userData}");
      // handleGetContact(
      //     Id: userData["id"].toString(),
      //     fullName: userData["name"].toString(),
      //     email: userData["email"].toString(),
      //     photoUrl: userData["picture"]['data']['url'].toString(),
      //     phoneNumber: "");
    } else {
      Get.snackbar("Info", result.message.toString());
    }
    // final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);
    //return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

//Sign Out
  void signOut() {
    try {
      firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

//Forgot password
  Future resetPassword(String Email) async {
    try {
      ResetLoader.value = true;

      await FirebaseAuth.instance.sendPasswordResetEmail(email: Email);
     // Get.toNamed(Routes.LOGIN);
      ResetLoader.value = false;
      Get.snackbar("Message", "Email Sent");
    } catch (e) {
      ResetLoader.value = false;

      print(e);
      Get.snackbar("Error", "${e}");
    }
    ResetLoader.value = false;
  }




  Future<void> verifyPhone(String phoneNumber) async {
    Phoneloader.value = true;

    try {
      Phoneloader.value = true;
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber:  phoneNumber,
          // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
          },
          codeSent: (verificationId, forceResendingToken) {
            Get.to(VerifyOtpViews(
              phoneNumber: phoneNumber,
              verificationId: verificationId,

            ));
          },
          // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 20),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          verificationFailed: (error) {
            Get.snackbar("Error", error.message.toString());
          });
      Phoneloader.value = false;

    } catch (e) {
      Phoneloader.value = false;

      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> verifyOTP(
      {required String smsCode,
        required String verificationId,
        required String phoneNumber}) async {
    var firebaseAuth1 = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    try {
      firebaseAuth.signInWithCredential(firebaseAuth1).then((value) {
        if (value.user != null) {
          Get.toNamed(Routes.LOCALAUTH);
          // handleGetContact(
          //     Id: value.user!.uid.toString(),
          //     fullName: value.user!.displayName.toString(),
          //     email: value.user!.email.toString(),
          //     photoUrl: value.user!.photoURL.toString(),
          //     phoneNumber: value.user!.phoneNumber.toString());
        } else {
          Get.snackbar("Info", "Wrong otp");
        }
      });
    } catch (e) {
      print(e);
    }
  }

}
