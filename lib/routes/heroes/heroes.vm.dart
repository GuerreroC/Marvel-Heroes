import 'package:dacodes/common/size_screen.dart';
import 'package:dacodes/model/heroes.model.dart';
import 'package:dacodes/provider/data.provider.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class HeroesViewModel extends ViewModel {
  List<Heroe> heroesList = [];

  @override
  void init() async {
    SizeScreen.init(MediaQuery.of(context));
    // SuperHeroProvider.instance.init();
    heroesList = await SuperHeroProvider.instance
        .getHeroesList()
        .whenComplete(() => notifyListeners());
  }
}
