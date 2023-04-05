import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dacodes/common/colors.dart';
import 'package:dacodes/common/size_screen.dart';
import 'package:dacodes/routes/hero_description/hero_desc.vm.dart';
import 'package:dacodes/widgets/button.widget.dart';
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
        backgroundColor: backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeScreen.width(5), vertical: SizeScreen.height(10)),
          child: Column(
            children: [
              HeroeInfo(viewModel),
              HeroeDescription(viewModel),
            ],
          ),
        ));
  }
}

class HeroeInfo extends StatelessWidget {
  final HeroeDescriptionViewModel viewModel;
  const HeroeInfo(
    this.viewModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isNotNullDescription =
        (viewModel.heroe.description != null) ? true : false;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
                imageUrl:
                    "${viewModel.heroe.thumbnail?.path}.${viewModel.heroe.thumbnail?.ext}",
                height: SizeScreen.height(20),
                width: SizeScreen.width(45),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
                placeholder: (context, _) =>
                    const Center(child: CircularProgressIndicator())),
          ),
          Container(
            padding: EdgeInsets.only(top: SizeScreen.height(2)),
            alignment: Alignment.center,
            width: SizeScreen.width(30),
            child: AutoSizeText(viewModel.heroe.name ?? 'Loading',
                style: appStyle),
          ),
          (isNotNullDescription && viewModel.heroe.description!.isNotEmpty)
              ? Container(
                  padding: EdgeInsets.only(top: SizeScreen.height(2)),
                  alignment: Alignment.center,
                  width: SizeScreen.width(80),
                  child: AutoSizeText(viewModel.heroe.description!,
                      style: appStyle, textAlign: TextAlign.justify),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class HeroeDescription extends StatelessWidget {
  final HeroeDescriptionViewModel viewModel;
  const HeroeDescription(
    this.viewModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: SizeScreen.height(2),
                horizontal: SizeScreen.width(5)),
            height: SizeScreen.height(30),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                ButtonWidget(
                    title: 'Comics',
                    data: '${viewModel.heroe.comics?.available}',
                    onPressed: () => viewModel.openHeroeList(ItemType.comics)),
                ButtonWidget(
                    title: 'Series',
                    data: '${viewModel.heroe.series?.available}',
                    onPressed: () => viewModel.openHeroeList(ItemType.series)),
                ButtonWidget(
                    title: 'Stories',
                    data: '${viewModel.heroe.stories?.available}',
                    onPressed: () => viewModel.openHeroeList(ItemType.stories)),
                ButtonWidget(
                    title: 'Events',
                    data: '${viewModel.heroe.events?.available}',
                    onPressed: () => viewModel.openHeroeList(ItemType.events)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
