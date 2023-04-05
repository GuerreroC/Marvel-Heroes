import 'dart:io';

import 'dart:convert';
import 'package:dacodes/model/heroes.model.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class SuperHeroProvider extends ChangeNotifier {
  SuperHeroProvider._();
  static final instance = SuperHeroProvider._();

  static String? copyright;

  Future<List<Heroe>> getHeroesList(int offset) async {
    if (await checkInternetConnection()) {
      String timeStamp = await getTimeStamp();
      String dataKey =
          "$timeStamp${marvelAPIData['private']}${marvelAPIData['public']}";
      Digest md5Hash = md5.convert(utf8.encode(dataKey));
      final Uri url = Uri.parse(
          "${marvelAPIData['url']}characters?apikey=${marvelAPIData['public']}&hash=$md5Hash&ts=$timeStamp&offset=$offset");
      final apiResp = await http.get(url);
      MarvelData marvelData = MarvelData.fromRawJson(apiResp.body);
      copyright = marvelData.attributionText;
      List<Heroe>? heroesList = marvelData.data?.results;
      if (marvelData.code == 200 && marvelData.status == 'Ok') {
        notifyListeners();
        return heroesList!;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

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

  Future<String> getTimeStamp() async {
    DateTime now = DateTime.now();

    String timePad(int number) {
      return number.toString().padLeft(2, '0');
    }

    String timeStamp =
        "${now.year}${timePad(now.month)}${timePad(now.day)}${timePad(now.hour)}${timePad(now.minute)}${timePad(now.second)}";
    return timeStamp;
  }
}

//For this exercise, I'll be using this instead a secured file for API keys
Map<String, String> marvelAPIData = {
  "url": "https://gateway.marvel.com:443/v1/public/",
  "public": "fea4ddbf370376865724c2b03db5ffef",
  "private": "dcca949708ec8a3a3b97cf51cacf65cd98a314c4"
};
