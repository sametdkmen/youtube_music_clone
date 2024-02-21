class ApplicationConstant {
  static ApplicationConstant? _instance;
  static ApplicationConstant get instance {
    _instance ??= ApplicationConstant._init();
    return _instance!;
  }

  ApplicationConstant._init();

  /// Home Constant

  final String startRadioFromSongTxt = "BİR ŞARKIDAN RADYO BAŞLATIN";
  final String fastSectionsTxt = "Hızlı seçimler";
  final String repeatListeningTxt = "Yeniden dinleyin";
  final String compiledForYouTxt = "Sizin için derlenenler";
}
