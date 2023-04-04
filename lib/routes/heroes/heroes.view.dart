import 'package:dacodes/common/colors.dart';
import 'package:dacodes/common/size_screen.dart';
import 'package:dacodes/provider/data.provider.dart';
import 'package:dacodes/routes/heroes/heroes.vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pmvvm/pmvvm.dart';

class HeroesScreen extends StatelessWidget {
  const HeroesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SuperHeroProvider.instance,
      child: Consumer<SuperHeroProvider>(
          builder: (context, value, child) => MVVM.builder(
              viewModel: HeroesViewModel(),
              viewBuilder: (context, vm) => const HeroesScreenView())),
    );
  }
}

class HeroesScreenView extends StatelessView<HeroesViewModel> {
  const HeroesScreenView({super.key});

  @override
  Widget render(BuildContext context, HeroesViewModel viewModel) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          toolbarHeight: SizeScreen.height(8),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: backgroundColor,
        ),
        body: const Center(
          child: Text('TEST'),
        ));
  }
}
