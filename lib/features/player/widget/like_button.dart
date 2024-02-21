import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_music_app/core/extension/context_extension.dart';

import '../../../core/constant/color_constant.dart';

class LikeButton extends StatelessWidget {
  final String likeCount;

  const LikeButton({super.key, required this.likeCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: context.dynamicHeight(0.042),
          width: context.dynamicWidth(0.17),
          margin: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: ColorConstant.instance.appShortCutButtonColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            splashColor: ColorConstant.instance.appSplashColor,
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 5.00,
                ),
                const Icon(
                  CupertinoIcons.heart_circle_fill,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5.00,
                ),
                Text(
                  likeCount,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: context.dynamicHeight(0.042),
          width: context.dynamicWidth(0.17),
          margin: const EdgeInsets.only(right: 2.00),
          decoration: BoxDecoration(
            color: ColorConstant.instance.appShortCutButtonColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            splashColor: ColorConstant.instance.appSplashColor,
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: context.dynamicHeight(.03),
                  width: 1,
                  color: Colors.white30,
                ),
                const Icon(
                  CupertinoIcons.heart_slash_circle,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
