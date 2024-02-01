import 'package:flutter/material.dart';
import 'package:youtube_music_app/core/extension/context_extension.dart';

import '../model/song.dart';

class SongCard extends StatelessWidget {
  final Song model;

  const SongCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                        "images/sarki_kapaklari/${model.imageName}"),
                                  ),
                                  const Icon(Icons.play_arrow,
                                      color: Colors.white, size: 35),
                                ],
                              ),
                              SizedBox(
                                height: context.dynamicHeight(0.01),
                              ),
                              Text(
                                model.songName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
  }
}