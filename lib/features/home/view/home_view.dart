import 'dart:math';
import 'package:flutter/material.dart';
import 'package:youtube_music_clone/components/other_button.dart';
import 'package:youtube_music_clone/components/song_card.dart';
import 'package:youtube_music_clone/core/extension/context_extension.dart';
import 'package:youtube_music_clone/core/operation/general_operation.dart';
import 'package:youtube_music_clone/features/home/mixin/home_view_mixin.dart';
import 'package:youtube_music_clone/model/playlist.dart';
import 'package:youtube_music_clone/model/song.dart';
import '../../../components/bottom_nav_bar.dart';
import '../../../components/playlist_card.dart';
import '../../../components/quick_pick_card.dart';
import '../../../components/up_chip.dart';
import '../../../core/constant/application_constant.dart';
import '../appbar/home_app_bar.dart';

part '../delegate/custom_sliver_app_bar_delegate.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with HomeViewMixin, SingleTickerProviderStateMixin {
  @override
  void initState() {
    pageScrollController.addListener(onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return ValueListenableBuilder<double>(
      valueListenable: isScrollOpacity,
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: const AssetImage('assets/images/logo/bg3.png'),
            opacity: isScrollOpacity.value,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.6),
              BlendMode.darken,
            ),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: NestedScrollView(
                controller: pageScrollController,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    /// AppBar - YouTube Logo - Search - TV - Profile
                    SliverToBoxAdapter(
                        child: ValueListenableBuilder<double>(
                      valueListenable: isScrollOpacity,
                      builder: (context, value, child) => HomeAppBar(
                        dynamicOpacity: isScrollOpacity.value,
                      ),
                    )),

                    /// Category chips (pinned while scrolling)
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: _CustomSliverAppBarDelegate(statusBarHeight),
                    )
                  ];
                },
                body: RefreshIndicator(
                    onRefresh: GeneralOperation.refreshHome,
                    color: Colors.black,
                    child: screenHeight(context, textTheme)),
              ),
            ),
            bottomNavigationBar: CustomBottomNavBar(context: context)),
      ),
    );
  }

  Widget get _sectionSpace => SizedBox(
        height: context.dynamicHeight(0.02),
      );
  Widget get _playRadioWithSong => Padding(
        padding: EdgeInsets.only(
            left: context.dynamicWidth(.037),
            right: context.dynamicWidth(.037),
            top: context.dynamicHeight(.035),
            bottom: context.dynamicHeight(.02)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.vertical,
              spacing: 1,
              children: [
                Text(
                  ApplicationConstant.instance.startRadioFromSongTxt,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  ApplicationConstant.instance.fastSectionsTxt,
                  style: const TextStyle(
                      fontSize: 25,
                      fontFamily: "YoutubeSansSemibold",
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ],
            ),
            OtherButton(
              buttonTxt: "Tümünü oynat",
              onTap: () {},
            ),
          ],
        ),
      );

  Widget _defaultTitle(String txt) => Padding(
        padding: EdgeInsets.only(
            left: context.dynamicWidth(.037),
            right: context.dynamicWidth(.037),
            bottom: context.dynamicHeight(.02)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: "YoutubeSansSemibold",
                  fontWeight: FontWeight.w700),
            ),
            OtherButton(onTap: () {}),
          ],
        ),
      );

  Widget screenHeight(BuildContext context, TextTheme textTheme) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _playRadioWithSong,
          SizedBox(
            height: context.dynamicHeight(.3),
            child: FutureBuilder<List<Song>>(
              future: Song.fetchQuickPickList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 0,
                      mainAxisExtent: context.dynamicWidth(1),
                    ),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final card = QuickPickSongCard(model: snapshot.data![index]);
                      return QuickPickSongCard(
                        model: card.model,
                        onpressed: () => openPlayer(card.model, heroTag: card.heroTag),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
          ),
          _sectionSpace,
          _defaultTitle(ApplicationConstant.instance.repeatListeningTxt),
          SizedBox(
            height: context.dynamicHeight(.34),
            child: FutureBuilder<List<Song>>(
              future: Song.getMusicList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 100,
                      mainAxisSpacing: 18,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      final card = SongCard(model: snapshot.data![index]);
                      return SongCard(
                        model: card.model,
                        onpressed: () => openPlayer(card.model, heroTag: card.heroTag),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
          ),
          _sectionSpace,
          _defaultTitle(ApplicationConstant.instance.compiledForYouTxt),
          SizedBox(
            height: context.dynamicHeight(.3),
            child: FutureBuilder<List<PlayList>>(
              future: PlayList.getPlayList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final playlists = snapshot.data!;
                  return GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: playlists.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 145,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return PlayListCard(model: playlists[index]);
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
