import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:oauth2/oauth2.dart';
import 'package:returnz/app/routes/app_pages.dart';
import 'package:returnz/services/local_auth_api.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:webview_flutter/webview_flutter.dart';

class LocalauthController extends GetxController {
 final access_token = ''.obs;
  final storage = new FlutterSecureStorage();
  //TODO: Implement LocalauthController
  checkAuth() async{
    print("checking Auth");
  final isAuthenticated = await LocalAuthApi.authenticate();

  if (isAuthenticated) {
    Get.toNamed(Routes.NAVBAR);
  }else{
    print("Not authenticated");
  }

}
  final authorizationEndpoint = Uri.parse('https://www.coinbase.com/oauth/authorize');
  final tokenEndpoint = Uri.parse('http://www.coinbase.com/oauth/token');
  final identifier = 'bb9856078aa61cebb99fb0e8c1c3a580fa8e53e7cc648194701402b54b128537';
  final secret = '30c4378ec24a4fe4f4fcb3e0fc4bf72df7ee6c7934d40d73595fe856ee880ade';
  final redirectUrl = Uri.parse('my.app://oauth2redirect');
  final count = 0.obs;
  var authorizationUrl = Uri().obs;
  var responseUrl =Uri().obs;
  final state = false.obs;


  Future<void> makePostRequest_follow(var code) async {
    var jwt = await storage.read(key: "jwt");
    final url = Uri.parse('https://api.coinbase.com/oauth/token');
    final headers = {
      "Content-type": "application/x-www-form-urlencoded",
    };
    final response = await post(url, headers: headers, body: {
      'grant_type' : 'authorization_code',
      'code': '$code',
      'client_id':'bb9856078aa61cebb99fb0e8c1c3a580fa8e53e7cc648194701402b54b128537',
      'client_secret':'30c4378ec24a4fe4f4fcb3e0fc4bf72df7ee6c7934d40d73595fe856ee880ade',
      'redirect_uri':'my.app://oauth2redirect'
    });
    var jsonString = response.body;
    var data = json.decode(jsonString);
    print(data['access_token']);
    storage.write(key: "access", value: "${data['access_token']}");
     access_token.value = (await storage.read(key: "access"))!;
     print("Token :::: ${await storage.read(key: "access")}");
    print(response.statusCode);
  }


  @override
  void onInit() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    state.value = false;

    var grant = oauth2.AuthorizationCodeGrant(identifier, authorizationEndpoint, tokenEndpoint, secret: secret);
    authorizationUrl.value = grant.getAuthorizationUrl(redirectUrl,scopes: ["wallet:user:read,wallet:accounts:read,wallet:buys:read"]);
    print(authorizationUrl.value);
    //checkAuth();

    super.onInit();
  }

  @override
  void onReady() {

    print("okay");
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
