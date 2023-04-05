import 'package:dacodes/common/colors.dart';
import 'package:dacodes/common/size_screen.dart';
import 'package:dacodes/provider/data.provider.dart';
import 'package:dacodes/routes/heroes/heroes.vm.dart';
import 'package:dacodes/widgets/hero.widget.dart';
import 'package:flutter/material.dart';
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
        body: (viewModel.heroesList.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SizeScreen.width(5),
                    vertical: SizeScreen.height(10)),
                child: CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  slivers: [
                    SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            mainAxisSpacing: SizeScreen.height(1),
                            crossAxisSpacing: SizeScreen.width(2)),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return HeroeWidget(
                                heroe: viewModel.heroesList[index],
                                onTap: () => viewModel.openHeroeDetails(
                                    viewModel.heroesList[index]));
                          },
                          childCount: viewModel.heroesList.length,
                        ))
                  ],
                ),
              ));
  }
}
