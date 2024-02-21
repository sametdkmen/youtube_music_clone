import 'package:flutter/material.dart';
import 'package:youtube_music_app/core/extension/context_extension.dart';

import '../../../core/constant/color_constant.dart';

class ShortCutButton extends StatelessWidget {
  final Map<String, IconData> data;

  const ShortCutButton({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      height: context.dynamicHeight(0.042),
      width: context.dynamicWidth(0.25),
      decoration: BoxDecoration(
        color: ColorConstant.instance.appShortCutButtonColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: ColorConstant.instance.appSplashColor,
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              data.entries.first.value,
              color: Colors.white,
              weight: 1.0,
            ),
            Text(
              data.entries.first.key,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
