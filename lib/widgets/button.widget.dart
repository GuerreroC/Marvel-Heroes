import 'package:auto_size_text/auto_size_text.dart';
import 'package:dacodes/common/size_screen.dart';
import 'package:flutter/material.dart';

import '../common/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final String data;
  final void Function()? onPressed;
  const ButtonWidget({
    super.key,
    required this.title,
    required this.data,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
          alignment: Alignment.center,
          height: SizeScreen.height(5),
          width: double.infinity,
          child: AutoSizeText('$title:  $data', style: appStyle)),
    );
  }
}
