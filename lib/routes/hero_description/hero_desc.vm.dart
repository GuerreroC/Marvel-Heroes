import 'package:dacodes/model/heroes.model.dart';
import 'package:dacodes/widgets/modal.widget.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

enum ItemType { comics, series, stories, events }

class HeroeDescriptionViewModel extends ViewModel {
  late Heroe heroe;

  @override
  void init() {
    heroe = ModalRoute.of(context)!.settings.arguments as Heroe;
    super.init();
  }

  void openHeroeList(ItemType itemType) async {
    List? data = [];
    switch (itemType) {
      case ItemType.comics:
        data = heroe.comics?.items;
        break;
      case ItemType.series:
        data = heroe.series?.items;
        break;
      case ItemType.stories:
        data = heroe.stories?.items;
        break;
      case ItemType.events:
        data = heroe.events?.items;
        break;
    }

    await showURLAliasModal(context: context, dynamicData: data ?? []);
  }
}
