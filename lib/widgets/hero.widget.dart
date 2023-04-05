import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dacodes/common/colors.dart';
import 'package:dacodes/common/size_screen.dart';
import 'package:dacodes/model/heroes.model.dart';
import 'package:flutter/material.dart';

class HeroeWidget extends StatelessWidget {
  final Heroe heroe;
  final void Function()? onTap;
  const HeroeWidget({super.key, required this.heroe, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: dark,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                  imageUrl: "${heroe.thumbnail?.path}.${heroe.thumbnail?.ext}",
                  height: SizeScreen.height(20),
                  width: SizeScreen.width(45),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                  placeholder: (context, _) =>
                      const Center(child: CircularProgressIndicator())),
            ),
            Padding(
              padding: EdgeInsets.only(top: SizeScreen.height(2)),
              child: Center(
                child: SizedBox(
                  height: SizeScreen.height(2),
                  child: AutoSizeText(heroe.name ?? 'Loading',
                      style: const TextStyle(color: white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
