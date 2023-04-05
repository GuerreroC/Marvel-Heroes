import 'package:dacodes/common/colors.dart';
import 'package:dacodes/routes/hero_description/hero_desc.vm.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class HeroeDescriptionScreen extends StatelessWidget {
  const HeroeDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM.builder(
        viewModel: HeroeDescriptionViewModel(),
        viewBuilder: (context, vm) => const HeroeDescriptionView());
  }
}

class HeroeDescriptionView extends StatelessView<HeroeDescriptionViewModel> {
  const HeroeDescriptionView({super.key});

  @override
  Widget render(BuildContext context, HeroeDescriptionViewModel viewModel) {
    return Scaffold(
      backgroundColor: greyDark,
      body: Center(child: Text(viewModel.heroe.name!)),
    );
  }
}
