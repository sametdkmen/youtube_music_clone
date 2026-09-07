import 'package:flutter/material.dart';

import 'package:youtube_music_clone/core/extension/context_extension.dart';

import '../model/song.dart';

class SongCard extends StatelessWidget {
  final Song model;
  final void Function()? onpressed;

  const SongCard({
    super.key,
    required this.model,
    this.onpressed,
  });

  /// Hero tag shared with the player so the cover animates between screens.
  String get heroTag => 'song-cover-${model.id}';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inkImage(context),
        SizedBox(
          height: context.dynamicHeight(0.01),
        ),
        Text(
          model.songName,
          style: const TextStyle(
              color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _inkImage(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: heroTag,
            child: Container(
              height: context.dynamicHeight(0.12),
              width: context.dynamicHeight(0.12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage(
                    "assets/images/covers/${model.imageName}",
                  ))),
            ),
          ),
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: context.dynamicHeight(0.12),
              width: context.dynamicHeight(0.12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent),
              child: InkWell(
                  onTap: onpressed,
                  borderRadius: BorderRadius.circular(12),
                  splashColor: Colors.white60.withValues(alpha: 0.5),
                  child: const Icon(Icons.play_arrow,
                      color: Colors.white, size: 35)),
            ),
          ),
        ],
      );
}
