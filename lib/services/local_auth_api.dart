// ignore_for_file: unused_catch_clause, deprecated_member_use, prefer_const_constructors
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();
  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future authenticate() async {
    List<BiometricType> availableBiometrics = await _auth.getAvailableBiometrics();
    if (Platform.isIOS) {
      if (availableBiometrics.contains(BiometricType.face)) {
        // Face ID.
        final isAvailable = await hasBiometrics();
        if (!isAvailable) return false;
        try {
          return await _auth.authenticate(
            androidAuthStrings: AndroidAuthMessages(
              signInTitle: 'Finger Print Sensor ',
            ),
            localizedReason: 'Scan Finger to Authenticate',
            useErrorDialogs: false,
            stickyAuth: false,
          );
        } on PlatformException catch (e) {
          return false;
        }
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        // Touch ID.
      }
    }else{
      final isAvailable = await hasBiometrics();
      if (!isAvailable) return false;
      try {
        return await _auth.authenticateWithBiometrics(
          androidAuthStrings: AndroidAuthMessages(
            //signInTitle: 'Finger Print Sensor',
          ),
          localizedReason: 'Scan Finger to Authenticate',
          useErrorDialogs: false,
          stickyAuth: false,
        );
      } on PlatformException catch (e) {
        return false;
      }

    }
    print(availableBiometrics);

  }
}