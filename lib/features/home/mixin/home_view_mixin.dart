import 'package:flutter/material.dart';
import 'package:youtube_music_app/features/home/view/home_view.dart';

mixin HomeViewMixin on State<HomeView> {
  final ScrollController pageScrollController = ScrollController();
  //ScrollController get pageScrollController => _pageScrollController;
  ValueNotifier<bool> isTop = ValueNotifier(false);
  ValueNotifier<double> isScrollOpacity = ValueNotifier(1.0);
  late TabController tabController;

  @override
  void dispose() {
    pageScrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  void onScroll() async {
    if (_isTop) isTop.value = _isTop;
  }

  bool get _isTop {
    if (!pageScrollController.hasClients) return false;

    /// - Scroll son pozisyonunu alıyorum
    final maxScroll = pageScrollController.position.maxScrollExtent;

    /// - Mevcut scroll pozisyonunu alıyorum
    final currentScroll = pageScrollController.offset;

    // Scroll pozisyonuna bağlı olarak isScrollOpacity değerini hesapla ve tesrine çevir ki ilkte resim görünsün sonra yavaş yavaş siyah olsun
    final opacity = 1.0 - (currentScroll / (maxScroll / 2)).clamp(0.0, 1.0);

    // isScrollOpacity değerini güncelle
    isScrollOpacity.value = opacity;

    /// - Benim mevcut pozisyonum maxScrollun %90'ını geçmiş ise diğer sayfa getirilmeye başlansın yani true dönecek, küçük ise zaten false
    return currentScroll <= (maxScroll * .50);
  }
}
