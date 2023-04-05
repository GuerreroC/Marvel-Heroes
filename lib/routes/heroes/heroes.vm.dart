import 'package:dacodes/common/size_screen.dart';
import 'package:dacodes/model/heroes.model.dart';
import 'package:dacodes/provider/data.provider.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class HeroesViewModel extends ViewModel {
  List<Heroe> heroesList = [];
  String? copyright = '';
  ScrollController scrollController = ScrollController();
  bool isLoadingMoreHeroes = false;

  @override
  void init() async {
    SizeScreen.init(MediaQuery.of(context));
    heroesList =
        await SuperHeroProvider.instance.getHeroesList(0).whenComplete(() {
      copyright = SuperHeroProvider.copyright;
      notifyListeners();
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isLoadingMoreHeroes = true;
        notifyListeners();
        loadMoreHeroes();
      }
    });
  }

  void openHeroeDetails(Heroe heroe) {
    Navigator.of(context).pushNamed('/heroe_description', arguments: heroe);
  }

  void loadMoreHeroes() async {
    List<Heroe> moreHeroes =
        await SuperHeroProvider.instance.getHeroesList(heroesList.length);
    heroesList.addAll(moreHeroes);
    notifyListeners();
  }
}
