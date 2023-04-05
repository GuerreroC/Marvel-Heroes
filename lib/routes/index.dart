import 'package:flutter/material.dart';

import 'hero_description/hero_desc.view.dart';
import 'heroes/heroes.view.dart';

final appRoutes = <String, WidgetBuilder>{
  '/': (BuildContext context) => const HeroesScreen(),
  '/heroe_description': (BuildContext context) => const HeroeDescriptionScreen()
};
