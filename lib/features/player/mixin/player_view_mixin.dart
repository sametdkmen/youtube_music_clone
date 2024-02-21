import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_music_app/features/player/view/player_view.dart';

mixin PlayerViewMixin on State<PlayerView> {
  List<Map<String, IconData>> buttonList = [
    {'': Icons.hourglass_empty},
    {'41': CupertinoIcons.chat_bubble_text},
    {'Kaydet': Icons.playlist_add_outlined},
    {'Paylaş': Icons.share},
    {'İndir': Icons.download_for_offline_sharp},
    {'Radyo': Icons.radio},
  ];

  final Duration _songDuration = const Duration(minutes: 2, seconds: 56);

  ValueNotifier<double> sliderDuration = ValueNotifier(0.00);
  ValueNotifier<String> textDuration = ValueNotifier("0:00");

  Duration parseDuration(String durationString) {
    List<String> parts = durationString.split(':');
    return Duration(minutes: int.parse(parts[0]), seconds: int.parse(parts[1]));
  }

  String durationToString(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitsMinutes:$twoDigitsSeconds";
  }

  void changeDuration(double value) {
    sliderDuration.value = value;
    textDuration.value = durationToString(_songDuration * sliderDuration.value);
  }
}
