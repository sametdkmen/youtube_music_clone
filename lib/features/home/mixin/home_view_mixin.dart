import 'package:flutter/material.dart';
import 'package:youtube_music_app/features/home/view/home_view.dart';
import 'package:youtube_music_app/features/player/view/player_view.dart';

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
        return 'images/logo/bg1.png';
      case 1:
        return 'images/logo/bg2.png';
      case 2:
        return 'images/logo/bg3.png';
      case 3:
        return 'images/logo/bg4.png';
      case 4:
        return 'images/logo/bg5.png';
      default:
        return 'images/logo/bg.png';
    }
  }

  @override
  void dispose() {
    pageScrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  void playerShowBottomSheet(Song model) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return PlayerView(model: model);
      },
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
