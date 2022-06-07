import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:returnz/app/modules/localauth/controllers/localauth_controller.dart';
import 'package:returnz/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:returnz/app/modules/splash/controllers/splash_controller.dart';
import 'package:returnz/app/routes/app_pages.dart';
import 'package:returnz/models/CoinbasePortfilio.dart';




final String appBaseUrl = "https://api.coinbase.com/";
final String client_id = "ACEGLZB1KPBUK4D1BRKEUGW1LG1R12OWGSC5B5J5XPYOVCF1";
final String client_secret = "CM4AWJFQ2ZIS4WBTMVJKVMNHIEVFUKK514B3TWTXXY3ULQ03";
final storage = new FlutterSecureStorage();


SplashController controllerL = Get.find<SplashController>();
  var _dio = Dio(
    BaseOptions(
      baseUrl: appBaseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      contentType: 'application/json',
      headers: {"Authorization": "Bearer ${controllerL.access_token.value}"},
      responseType: ResponseType.plain,
    ),
  );




class Failure {
  // Use something like "int code;" if you want to translate error messages
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class APIManager {


  Future<SomeRootEntity> autoCompleteSearc() async {
    try {
      var response = await _dio.get("v2/accounts");
      print(response.data);
      print("Response : ${response.statusCode}");
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.data);
        SomeRootEntity dataFetched = SomeRootEntity.fromJson(responseData);
        return dataFetched;
      }

      // else if(response.statusCode == 401){
      //   storage.delete(key: "access");
      //   Get.offAndToNamed(Routes.ONBOARDING);
      //   Get.snackbar("Error", "Re - Authorize your Wallet");
      //   throw Failure(response.statusCode.toString());
      else {
        throw Failure(response.statusCode.toString());
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        print(e.response!.statusCode);
        storage.delete(key: "access");
        Get.offAndToNamed(Routes.ONBOARDING);
        Get.snackbar("Error", "Re - Authorize your Wallet");
      } else {
        print(e.message);
        //print(e.request);

      }
      print(e.response!.statusCode);
      throw Failure('No Internet connection 😑');
    }
    //catch (e){
    // print(e);
    //}

    // on SocketException {
    //
    //
    //   throw Failure('No Internet connection 😑');
    // }
  }


  Future<SomeRootEntity> ResposeData() async {
    try {

      var response = await _dio.get("v2/accounts");
      print(response.data);
      print("Response : ${response.statusCode}");
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.data);
        SomeRootEntity dataFetched = SomeRootEntity.fromJson(responseData);
        return dataFetched;
      }

      // else if(response.statusCode == 401){
      //   storage.delete(key: "access");
      //   Get.offAndToNamed(Routes.ONBOARDING);
      //   Get.snackbar("Error", "Re - Authorize your Wallet");
      //   throw Failure(response.statusCode.toString());
      else {
        throw Failure(response.statusCode.toString());
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        print(e.response!.statusCode);
        storage.delete(key: "access");
        Get.offAndToNamed(Routes.ONBOARDING);
        Get.snackbar("Error", "Re - Authorize your Wallet");
      } else {
        print(e.message);
        //print(e.request);

      }
      print(e.response!.statusCode);
      throw Failure('No Internet connection 😑');
    }

  }



  Future<SomeRootEntity> makePostRequest_follow() async {
    var access = await storage.read(key: "access");
    final url = Uri.parse('https://api.coinbase.com/v2/accounts/');
    final headers = {
      "connectTimeout": "5000",
      "receiveTimeout": "5000",
      "Authorization": 'Bearer ${access}',
      "Content-type": "application/json",
    };
    final response = await get(url, headers: headers);
    var jsonString = response.body;
    print(jsonString);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      SomeRootEntity dataFetched = SomeRootEntity.fromJson(responseData);
      return dataFetched;
    } else if(response.statusCode == 401){
      //print(e.response!.statusCode);
      storage.delete(key: "access");
      Get.offAndToNamed(Routes.ONBOARDING);
      Get.snackbar("Error", "Re - Authorize your Wallet");
      throw Failure(response.statusCode.toString());
    }else{
      throw Failure(response.statusCode.toString());

    }
  }


}
