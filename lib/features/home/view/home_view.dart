import 'dart:math';

import 'package:flutter/material.dart';
import 'package:youtube_music_app/components/other_button.dart';
import 'package:youtube_music_app/components/song_card.dart';
import 'package:youtube_music_app/core/extension/context_extension.dart';
import 'package:youtube_music_app/features/home/mixin/home_view_mixin.dart';
import 'package:youtube_music_app/model/categories.dart';
import 'package:youtube_music_app/model/playlist.dart';
import 'package:youtube_music_app/model/song.dart';
import '../../../components/bottom_nav_bar.dart';
import '../../../components/playlist_card.dart';
import '../../../components/quick_pick_card.dart';
import '../appbar/home_app_bar.dart';

part '../delegate/custom_sliver_app_bar_delegate.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with HomeViewMixin, SingleTickerProviderStateMixin {
  @override
  @override
  void initState() {
    tabController =
        TabController(length: Categories.upCategoryList.length, vsync: this);
    tabController.addListener(_handleTabSelection);
    pageScrollController.addListener(onScroll);
    super.initState();
  }

  void _handleTabSelection() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: ValueListenableBuilder<double>(
        valueListenable: isScrollOpacity,
        builder: (context, value, child) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('images/logo/gradient_bg.png'),
              opacity: value,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: NestedScrollView(
                controller: pageScrollController,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    /// AppBar - YouTube Logo - Search - TV - Profile
                    const SliverToBoxAdapter(child: HomeAppBar()),

                    /// Category Seçme Bölümü

                    // TODO: Burada kategori divider inceliği yine scroll değerine göre incelip artacak gerçek uygulamada olduğu gibi
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: _CustomSliverAppBarDelegate(
                        TabBar(
                          controller: tabController,
                          indicator:
                              const BoxDecoration(color: Colors.transparent),
                          dividerColor: Colors.grey.shade600,
                          dividerHeight: isTop.value ? 0.2 : 0.0,
                          tabs: List.generate(
                            Categories.upCategoryList.length,
                            (index) {
                              return Tab(
                                child: Container(
                                  height: context.dynamicHeight(0.04),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: tabController.index == index
                                        ? Colors.white
                                        : Colors
                                            .grey, // Seçili tab beyaz, diğerleri şeffaf
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: Colors.grey.shade400),
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.none,
                                    child: Text(
                                      Categories.upCategoryList[index].name,
                                      style: TextStyle(
                                          color: tabController.index == index
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: screenHeight(context, textTheme),
              ),
              bottomNavigationBar: CustomBottomNavBar()
              //ALT DÜĞMELER
              ),
        ),
      ),
    );
  }

  Widget get _sectionSpace => SizedBox(
        height: context.dynamicHeight(0.02),
      );
  Widget get _playRadioWithSong => Padding(
        padding: EdgeInsets.only(
            left: context.dynamicWidth(.021),
            top: context.dynamicHeight(.02),
            bottom: context.dynamicHeight(.02)),
        child: const Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.vertical,
          spacing: 1,
          children: [
            Text(
              "BİR ŞARKIDAN RADYO BAŞLATIN",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white54,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              "Hızlı seçimler",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "YoutubeSansSemibold",
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ],
        ),
      );

  Widget _defaultTitle(String txt) => Padding(
        padding: EdgeInsets.only(
            left: context.dynamicWidth(.021),
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
            const OtherButton(),
          ],
        ),
      );

  Widget screenHeight(BuildContext context, TextTheme textTheme) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _playRadioWithSong, // BİR ŞARKIDAN RADYO BAŞLATIN
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
                    itemBuilder: (context, indeks) {
                      return QuickPickSongCard(model: snapshot.data![indeks]);
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
          ), // HIZLI SEÇİMLER * MÜZİKLER
          _sectionSpace,
          _defaultTitle("Yeniden dinleyin"), // YENİDEN DİNLEYİN - DİĞER BUTONU
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
                      mainAxisExtent:
                          100, //bu ozellıge bakılacak. burada kaldım......
                      mainAxisSpacing: 18,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, indeks) {
                      return SongCard(
                        model: snapshot.data![indeks],
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
          ), // MÜZİKLER
          _sectionSpace,
          _defaultTitle(
              "Sizin için derlenenler"), // SİZİN İÇİN DERLENENLER - DİĞER BUTONU
          SizedBox(
            height: context.dynamicHeight(.3),
            child: FutureBuilder<List<PlayList>>(
              future: PlayList.getPlayList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var calmaListesi = snapshot.data;
                  return GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: calmaListesi!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          1, //bir satırda gösterilecek eleman sayısı
                      mainAxisExtent: 145, //uzunluğunu, kapsamını veriyorum.
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, indeks) {
                      return PlayListCard(
                        model: calmaListesi[indeks],
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
          ), // PLAYLİSTLER
        ],
      ),
    );
  }
}
