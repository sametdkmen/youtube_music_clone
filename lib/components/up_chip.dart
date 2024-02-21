// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../model/categories.dart';

class UpChip extends StatefulWidget implements PreferredSizeWidget {
  const UpChip({
    Key? key,
  }) : super(key: key);

  @override
  State<UpChip> createState() => _UpChipState();

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}

class _UpChipState extends State<UpChip> {
  ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.00),
        child: Row(
          children: List.generate(Categories.upCategoryList.length, (index) {
            return ValueListenableBuilder<int>(
              valueListenable: currentIndex,
              builder: (context, value, child) => Container(
                padding: EdgeInsets.only(left: _kDefaultLeftPaddingValue),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () => currentIndex.value = index,
                      style: TextButton.styleFrom(
                        side: BorderSide(
                          width: 0.8, //dış kenarlık kalınlığı
                          color: Colors.grey.withAlpha(50),
                        ),
                        backgroundColor: currentIndex.value == index
                            ? Colors.white
                            : Colors.white24.withAlpha(38),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        alignment: Alignment.center,
                      ),
                      child: Text(
                        Categories.upCategoryList[index].name,
                        style: TextStyle(
                            color: currentIndex.value == index
                                ? Colors.black
                                : Colors.white,
                            fontSize: 13,
                            overflow: TextOverflow.visible,
                            letterSpacing: 0.6,
                            fontWeight: FontWeight.bold),
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
