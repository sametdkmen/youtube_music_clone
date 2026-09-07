import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_music_clone/data/models/playlist.dart';
import 'package:youtube_music_clone/data/models/quick_pick.dart';
import 'package:youtube_music_clone/data/models/song.dart';
import 'package:youtube_music_clone/data/mood_filters.dart';
import 'package:youtube_music_clone/ui/widgets/more_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Layout ratios tuned per screen size (see build()).
  double songsSectionDivisor = 0;
  double quickPicksSectionDivisor = 0;
  double quickPickTileExtent = 0;
  double moodFilterHeightDivisor = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    if (screenHeight >= 700) {
      songsSectionDivisor = 2.9;
      quickPicksSectionDivisor = 3.5;
      quickPickTileExtent = 386;
      moodFilterHeightDivisor = 24;
    } else {
      songsSectionDivisor = 2.44;
      quickPicksSectionDivisor = 2.8;
      quickPickTileExtent = 400;
      moodFilterHeightDivisor = 22;
    }

    if (!(screenWidth >= 400 && screenHeight >= 670)) {
      quickPickTileExtent = 385;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SvgPicture.asset(
          'assets/images/logo/white_logo.svg',
          height: 25,
          fit: BoxFit.cover,
        ),
        actions: [
          IconButton(icon: const Icon(Icons.cast), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.account_circle_sharp), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo/gradient_bg.png'),
                fit: BoxFit.cover,
                alignment: Alignment.centerRight,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                _buildMoodFilters(screenHeight),
                const SizedBox(height: 15),
                _buildQuickPicksHeader(screenWidth, screenHeight),
                _buildQuickPicks(screenWidth, screenHeight),
                const SizedBox(height: 15),
                _buildSectionTitle("Yeniden dinleyin", horizontalPadding: 17, height: 44),
                const SizedBox(height: 14),
                _buildSongs(screenHeight),
                _buildSectionTitle("Sizin için derlenenler", horizontalPadding: 15),
                const SizedBox(height: 20),
                _buildPlaylists(context, screenWidth),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.withAlpha(15),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Ana Sayfa"),
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.compass_fill),
            icon: Icon(CupertinoIcons.compass),
            label: "Keşfet",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music_outlined),
            activeIcon: Icon(Icons.library_music),
            label: "Kitaplık",
          ),
        ],
      ),
    );
  }

  Widget _buildMoodFilters(double screenHeight) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: List.generate(moodFilters.length, (index) {
            return Container(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                height: screenHeight / moodFilterHeightDivisor,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    side: BorderSide(width: 0.8, color: Colors.grey.withAlpha(50)),
                    backgroundColor: Colors.white24.withAlpha(38),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    alignment: Alignment.center,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      moodFilters[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        overflow: TextOverflow.visible,
                        letterSpacing: 0.6,
                        fontFamily: "RobotoLight",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildQuickPicksHeader(double screenWidth, double screenHeight) {
    return SizedBox(
      height: screenHeight / 12,
      width: screenWidth,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BİR ŞARKIDAN RADYO BAŞLATIN",
              style: TextStyle(fontSize: 14, color: Colors.white54, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 2),
            Text(
              "Hızlı seçimler",
              style: TextStyle(
                fontSize: 25,
                fontFamily: "YoutubeSansSemibold",
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickPicks(double screenWidth, double screenHeight) {
    return SizedBox(
      height: screenHeight / quickPicksSectionDivisor,
      child: FutureBuilder<List<QuickPick>>(
        future: QuickPick.fetchAll(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center();
          final quickPicks = snapshot.data!;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 0,
              mainAxisExtent: quickPickTileExtent,
            ),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            itemCount: quickPicks.length,
            itemBuilder: (context, index) {
              final quickPick = quickPicks[index];
              return Container(
                color: Colors.transparent,
                height: 62,
                width: screenWidth,
                alignment: Alignment.center,
                child: ListTile(
                  onTap: () {},
                  leading: Container(
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(image: AssetImage(quickPick.coverAssetPath)),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        quickPick.title,
                        style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        quickPick.artist,
                        style: const TextStyle(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    iconSize: 18,
                    highlightColor: Colors.white,
                    alignment: Alignment.center,
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_rounded),
                    color: Colors.white54,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title, {required double horizontalPadding, double? height}) {
    final row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: "YoutubeSansSemibold",
            fontWeight: FontWeight.w700,
          ),
        ),
        const MoreButton(),
      ],
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: height == null ? row : SizedBox(height: height, child: row),
    );
  }

  Widget _buildSongs(double screenHeight) {
    return SizedBox(
      height: screenHeight / songsSectionDivisor,
      child: FutureBuilder<List<Song>>(
        future: Song.fetchAll(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center();
          final songs = snapshot.data!;
          return GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: songs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisExtent: 100,
              mainAxisSpacing: 13,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final song = songs[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 98,
                        height: 98,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(song.coverAssetPath),
                        ),
                      ),
                      const Icon(Icons.play_arrow, color: Colors.white, size: 30),
                    ],
                  ),
                  const SizedBox(height: 6.5),
                  Text(
                    song.title,
                    style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildPlaylists(BuildContext context, double screenWidth) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.8,
      width: screenWidth,
      child: FutureBuilder<List<Playlist>>(
        future: Playlist.fetchAll(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center();
          final playlists = snapshot.data!;
          return GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: playlists.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisExtent: 140,
              mainAxisSpacing: 2,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final playlist = playlists[index];
              return SizedBox(
                height: MediaQuery.of(context).size.height / 2.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(playlist.coverAssetPath),
                      ),
                    ),
                    const SizedBox(height: 6.5),
                    Text(
                      playlist.name,
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 3),
                    Wrap(
                      children: [
                        Text(
                          playlist.description,
                          style: const TextStyle(color: Colors.white60, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
