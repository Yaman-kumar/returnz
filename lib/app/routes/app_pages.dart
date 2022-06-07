import 'package:get/get.dart';

import '../modules/connection_page/bindings/connection_page_binding.dart';
import '../modules/connection_page/views/connection_page_view.dart';
import '../modules/crypto/bindings/crypto_binding.dart';
import '../modules/crypto/views/crypto_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/localauth/bindings/localauth_binding.dart';
import '../modules/localauth/views/localauth_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_email/login_email.dart';
import '../modules/login/views/otp/login_view.dart';
import '../modules/login/views/otp_verify.dart';
import '../modules/login/views/sign_up_email/sign_up_phone.dart';
import '../modules/login/views/sign_up_email/signup.dart';
import '../modules/navbar/bindings/navbar_binding.dart';
import '../modules/navbar/views/navbar_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/stocks/bindings/stocks_binding.dart';
import '../modules/stocks/views/stocks_view.dart';
import '../modules/verify_otp/bindings/verify_otp_binding.dart';
import '../modules/verify_otp/views/verify_otp_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LOGINEMAIL,
      page: () => LoginViewEmail(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUPPHONE,
      page: () => SignUpViewPhone(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUPEMAIL,
      page: () => SignUpViewEmail(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CONNECTION_PAGE,
      page: () => ConnectionPageView(),
      binding: ConnectionPageBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFY,
      page: () => OtpVerify(),
      binding: ConnectionPageBinding(),
    ),
    GetPage(
      name: _Paths.CRYPTO,
      page: () => CryptoView(),
      binding: CryptoBinding(),
    ),
    GetPage(
      name: _Paths.STOCKS,
      page: () => StocksView(),
      binding: StocksBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.LOCALAUTH,
      page: () => LocalauthView(),
      binding: LocalauthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_OTP,
      page: () => VerifyOtpView(),
      binding: VerifyOtpBinding(),
    ),
  ];
}
