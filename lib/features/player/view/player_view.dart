import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_music_app/core/extension/context_extension.dart';
import 'package:youtube_music_app/features/player/widget/like_button.dart';
import 'package:youtube_music_app/features/player/widget/shortcut_button.dart';

import '../../../model/song.dart';
import '../mixin/player_view_mixin.dart';
import '../widget/player_app_bar.dart';

class PlayerView extends StatefulWidget {
  final Song model;

  const PlayerView({super.key, required this.model});

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> with PlayerViewMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(1),
      decoration: BoxDecoration(gradient: _gradientBackground),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PlayerAppBar(),
                _songPhoto,
                _songInfo,
                _shortCutButton,
                _playGroup,
                _controlButton,
                _bottomSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _bottomSpace => SizedBox(
        height: context.dynamicHeight(0.08),
      );

  LinearGradient get _gradientBackground => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.2, 0.35, 0.5, 1.0],
        colors: [
          Color.fromARGB(255, 5, 42, 70),
          Color.fromARGB(255, 5, 42, 65),
          Color.fromARGB(255, 7, 26, 58),
          Colors.black
        ],
      );

  Widget get _songPhoto => Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.00),
        height: context.dynamicHeight(0.41),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "images/sarki_kapaklari/${widget.model.imageName}",
            ),
          ),
        ),
      );

  Widget get _songInfo => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.model.songName,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text(widget.model.singerName,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white54, fontWeight: FontWeight.w300))
          ],
        ),
      );

  Widget get _shortCutButton => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              buttonList.length,
              (index) => index == 0
                  ? LikeButton(likeCount: widget.model.likeCount)
                  : ShortCutButton(data: buttonList[index])),
        ),
      );

  Widget get _playGroup => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _playBar,
          _songDuration(),
        ],
      );

  Widget get _playBar => ValueListenableBuilder<double>(
        valueListenable: sliderDuration,
        builder: (context, value, child) => Slider(
          inactiveColor: Colors.grey.shade500,
          activeColor: Colors.white,
          allowedInteraction: SliderInteraction.tapAndSlide,
          value: sliderDuration.value,
          onChanged: changeDuration,
        ),
      );

  Widget _songDuration() {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.00),
      child: ValueListenableBuilder<String>(
        valueListenable: textDuration,
        builder: (context, value, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textDuration.value,
              style: textTheme.bodySmall?.copyWith(color: Colors.white),
            ),
            Text(
              '2:56',
              style: textTheme.bodySmall?.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget get _controlButton => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.shuffle_thick,
                size: 25,
                color: Colors.white70,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.skip_previous_sharp,
                size: 38,
                color: Colors.white70,
              )),
          IconButton.filled(
              color: Colors.black,
              padding: const EdgeInsets.all(8.00),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {},
              icon: const Icon(Icons.play_arrow, size: 40)),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.skip_next_sharp,
                color: Colors.white70,
                size: 38,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.repeat_outlined,
                size: 25,
                color: Colors.white70,
              )),
        ],
      );
}
