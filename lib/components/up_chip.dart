import 'package:flutter/material.dart';
import 'package:youtube_music_app/core/extension/context_extension.dart';

import '../model/categories.dart';

class UpChip extends StatefulWidget implements PreferredSizeWidget {
  const UpChip({super.key});

  @override
  State<UpChip> createState() => _UpChipState();

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}

class _UpChipState extends State<UpChip> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: List.generate(Categories.upCategoryList.length, (index) {
            return Container(
              padding: EdgeInsets.only(left: _kDefaultLeftPaddingValue),
              child: SizedBox(
                height: context.dynamicHeight(0.04),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        debugPrint(
                            "${Categories.upCategoryList[index].name} tıklandı.");
                      },
                      style: TextButton.styleFrom(
                        side: BorderSide(
                          width: 0.8, //dış kenarlık kalınlığı
                          color: Colors.grey.withAlpha(50),
                        ),
                        backgroundColor: Colors.white24.withAlpha(38),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        alignment: Alignment.center,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          Categories.upCategoryList[index].name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              overflow: TextOverflow.visible,
                              letterSpacing: 0.6,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  /// button spacing
  double get _kDefaultLeftPaddingValue => 8.00;
}
