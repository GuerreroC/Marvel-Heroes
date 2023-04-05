import 'package:dacodes/model/heroes.model.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class HeroeDescriptionViewModel extends ViewModel {
  late Heroe heroe;

  @override
  void init() {
    heroe = ModalRoute.of(context)!.settings.arguments as Heroe;
    super.init();
  }
}
