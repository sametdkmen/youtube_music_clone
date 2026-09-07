import 'package:flutter/material.dart';
import 'package:youtube_music_clone/features/home/view/home_view.dart';
import 'package:youtube_music_clone/features/player/view/player_view.dart';

import '../../../model/song.dart';

mixin HomeViewMixin on State<HomeView> {
  final ScrollController pageScrollController = ScrollController();
  //ScrollController get pageScrollController => _pageScrollController;
  ValueNotifier<bool> isTop = ValueNotifier(false);
  ValueNotifier<double> isScrollOpacity = ValueNotifier(0.5);
  ValueNotifier<double> isAppBarOpacity = ValueNotifier(0.0);

  ValueNotifier<int> categoryIndex = ValueNotifier(0);

  String changeBackgroundImage() {
    switch (categoryIndex.value) {
      case 0:
        return 'assets/images/logo/bg1.png';
      case 1:
        return 'assets/images/logo/bg2.png';
      case 2:
        return 'assets/images/logo/bg3.png';
      case 3:
        return 'assets/images/logo/bg4.png';
      case 4:
        return 'assets/images/logo/bg5.png';
      default:
        return 'assets/images/logo/bg.png';
    }
  }

  @override
  void dispose() {
    pageScrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  /// Opens the full-screen player. The cover art flies from the tapped card
  /// into the player via a [Hero] keyed by [heroTag].
  void openPlayer(Song model, {required String heroTag}) {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        transitionDuration: const Duration(milliseconds: 350),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (_, __, ___) => PlayerView(model: model, heroTag: heroTag),
        transitionsBuilder: (_, animation, __, child) {
          final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: Offset.zero).animate(curved),
            child: FadeTransition(opacity: curved, child: child),
          );
        },
      ),
    );
  }

  void onScroll() async {
    isTop.value = _isTop;
  }

  bool get _isTop {
    if (!pageScrollController.hasClients) return false;

    /// - Scroll son pozisyonunu alıyorum
    final maxScroll = pageScrollController.position.maxScrollExtent;

    /// - Mevcut scroll pozisyonunu alıyorum
    final currentScroll = pageScrollController.offset;

    // Scroll pozisyonuna bağlı olarak opacity değerini hesapla
    // Scroll yüzdesini 0.0 ile 0.5 arasında ölçeklendir
    final percentage = currentScroll / maxScroll;
    final opacity = (1.0 - percentage) * 0.5; // Maksimum 0.5 opacity değeri

    // isScrollOpacity değerini güncelle
    isScrollOpacity.value = opacity.clamp(0.0, 0.5);

    /// - Benim mevcut pozisyonum maxScrollun %90'ını geçmiş ise diğer sayfa getirilmeye başlansın yani true dönecek, küçük ise zaten false
    return currentScroll <= (maxScroll * .50);
  }
}
