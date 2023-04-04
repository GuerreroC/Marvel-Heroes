import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SuperHeroProvider extends ChangeNotifier {
  SuperHeroProvider._();
  static final instance = SuperHeroProvider._();

  Future<bool> checkInternetConnection() async {
    try {
      final checkInternetFunction = InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 3));
      final result = await checkInternetFunction;
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //Device has Internet
        return true;
      }
    } on SocketException catch (_) {
      //No internet access
      return false;
    }
    return false;
  }
}
