/// A playlist shown in the "Made for you" section of the home screen.
class Playlist {
  final int id;
  final String name;
  final String description;
  final String coverFileName;

  const Playlist({
    required this.id,
    required this.name,
    required this.description,
    required this.coverFileName,
  });

  String get coverAssetPath => 'assets/images/$coverFileName';

  static Future<List<Playlist>> fetchAll() async {
    return const [
      Playlist(id: 1, name: "Supermix'im", description: "Gazapizm, UZI, Ezhel", coverFileName: "mixart.jpg"),
      Playlist(id: 2, name: "Karışık Listem 1", description: "Sagopa Kajmer, Lil Zey", coverFileName: "mixart2.jpg"),
      Playlist(id: 3, name: "Karışık Listem 2", description: "İlyas Yalçıntaş, Sezen Aksu", coverFileName: "mixart3.jpg"),
      Playlist(id: 4, name: "2022 Recap", description: "Oynatma listesi • Senin için oluşturuldu", coverFileName: "recap.png"),
      Playlist(id: 5, name: "Pop 100", description: "En Popüler 100 Şarkı", coverFileName: "pop100.png"),
      Playlist(id: 6, name: "Beğendikleriniz", description: "Otomatik oynatma listesi", coverFileName: "liked.png"),
    ];
  }
}
