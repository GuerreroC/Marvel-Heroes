import 'dart:convert';

import 'package:pmvvm/pmvvm.dart';
import 'package:crypto/crypto.dart';

class HeroesViewModel extends ViewModel {
  String input = "hello world";

  @override
  void init() {
    String timeStamp = DateTime.now().toIso8601String();
    List<int> bytes = utf8.encode(input);
    Digest md5Hash = md5.convert(bytes);
    String hashString = md5Hash.toString();
    print("Input: $input");
    print("Hash: $hashString");
    print(timeStamp);
  }
}
