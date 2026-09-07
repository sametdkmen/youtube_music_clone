/// A song shown in the "Listen again" section of the home screen.
class Song {
  final int id;
  final String title;
  final String coverFileName;

  const Song({
    required this.id,
    required this.title,
    required this.coverFileName,
  });

  String get coverAssetPath => 'assets/images/covers/$coverFileName';

  static Future<List<Song>> fetchAll() async {
    return const [
      Song(id: 1, title: "Seni Dert Etmeler", coverFileName: "senidertetmeler.jpg"),
      Song(id: 2, title: "Gecenin İçine Gir", coverFileName: "geceninicinegir.png"),
      Song(id: 3, title: "Sarılırım Birine", coverFileName: "sarilirimbirine.jpg"),
      Song(id: 4, title: "Siyah", coverFileName: "siyah.png"),
      Song(id: 5, title: "Unutulanlar", coverFileName: "unutulanlar.jpg"),
      Song(id: 6, title: "Don't Speak", coverFileName: "dontspeak.jpg"),
      Song(id: 7, title: "Mayıs 6", coverFileName: "mayis6.jpg"),
      Song(id: 8, title: "Yalnızlık Son Ses", coverFileName: "yalnizliksonses.jpg"),
      Song(id: 9, title: "Kor", coverFileName: "kor.jpg"),
      Song(id: 10, title: "Baytar", coverFileName: "baytar.jpg"),
      Song(id: 11, title: "Affet", coverFileName: "affet.jpg"),
      Song(id: 12, title: "everything i wanted", coverFileName: "everythingiwanted.jpg"),
    ];
  }
}
