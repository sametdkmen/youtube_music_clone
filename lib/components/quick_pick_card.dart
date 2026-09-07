import 'package:flutter/material.dart';
import 'package:youtube_music_clone/core/constant/color_constant.dart';
import 'package:youtube_music_clone/core/extension/context_extension.dart';

import '../model/song.dart';

class QuickPickSongCard extends StatelessWidget {
  final Song model;
  final void Function()? onpressed;

  const QuickPickSongCard({
    super.key,
    required this.model,
    this.onpressed,
  });

  /// Hero tag shared with the player so the cover animates between screens.
  String get heroTag => 'quick-pick-cover-${model.id}';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 62,
      width: context.dynamicWidth(1),
      alignment: Alignment.center,
      child: ListTile(
        onTap: onpressed,
        splashColor: ColorConstant.instance.appSplashColor,
        leading: Hero(
          tag: heroTag,
          child: Container(
            height: context.dynamicHeight(0.06),
            width: context.dynamicHeight(0.06),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/covers/${model.imageName}",
                ),
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              model.songName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 1,
            ),
            Text(
              model.singerName,
              style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        trailing: IconButton(
          iconSize: 18,
          highlightColor: Colors.white, //tıklanıldığında ki renk
          alignment: Alignment.center,
          onPressed: () {},
          icon: const Icon(Icons.more_vert_rounded),
          color: Colors.white54,
        ),
      ),
    );
  }
}
