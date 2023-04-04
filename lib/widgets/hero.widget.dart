import 'package:cached_network_image/cached_network_image.dart';
import 'package:dacodes/common/colors.dart';
import 'package:dacodes/common/size_screen.dart';
import 'package:dacodes/model/heroes.model.dart';
import 'package:flutter/material.dart';

class HeroeWidget extends StatelessWidget {
  final Heroe heroe;
  const HeroeWidget({super.key, required this.heroe});
  @override
  Widget build(BuildContext context) {
    String cachedImg =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkz6A6HBm_SPHCfoRPzLnKKDIiiHvK2_MUhg&usqp=CAU';
    return Container(
      // height: SizeScreen.height(30),
      // width: SizeScreen.width(30),
      color: greyDark,
      child: Column(
        children: [
          CachedNetworkImage(
              imageUrl: "${heroe.thumbnail?.path}.${heroe.thumbnail?.ext}",
              fit: BoxFit.contain,
              placeholder: (context, _) =>
                  const Center(child: CircularProgressIndicator())),
          // Center(
          //   child: Text(heroe.name ?? 'Loading'),
          // ),
        ],
      ),
    );
  }
}
