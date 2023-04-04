import 'package:dacodes/common/size_screen.dart';
import 'package:dacodes/provider/data.provider.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class HeroesViewModel extends ViewModel {
  @override
  void init() {
    SizeScreen.init(MediaQuery.of(context));
    getData();
  }

  getData() async {
    await SuperHeroProvider.instance.getHeroesList();
  }
}
