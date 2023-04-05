import 'package:auto_size_text/auto_size_text.dart';
import 'package:dacodes/common/colors.dart';
import 'package:dacodes/common/size_screen.dart';
import 'package:flutter/material.dart';

showURLAliasModal({required BuildContext context, required List dynamicData}) {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));
  return Future.delayed(const Duration(milliseconds: 400))
      .then((value) => showModalBottomSheet(
            context: context,
            backgroundColor: backgroundColor,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(SizeScreen.width(10))),
            ),
            builder: (context) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: SizeScreen.height(1)),
                child: SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded,
                              size: 30, color: white)),
                      (dynamicData.isNotEmpty)
                          ? SizedBox(
                              height: SizeScreen.height(50),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: dynamicData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading: CircleAvatar(
                                      child: Text('${index + 1}'),
                                    ),
                                    title: AutoSizeText(
                                        dynamicData[index].name ?? 'Loading',
                                        style: appStyle),
                                  );
                                },
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              height: SizeScreen.height(10),
                              child: AutoSizeText('No Data Available',
                                  style: appStyle),
                            )
                    ],
                  ),
                ),
              );
            },
          ));
}
