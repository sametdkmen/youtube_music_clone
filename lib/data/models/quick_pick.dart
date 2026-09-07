/// A song shown in the "Quick picks" section of the home screen.
class QuickPick {
  final int id;
  final String title;
  final String artist;
  final String coverFileName;

  const QuickPick({
    required this.id,
    required this.title,
    required this.artist,
    required this.coverFileName,
  });

  String get coverAssetPath => 'assets/images/covers/$coverFileName';

  static Future<List<QuickPick>> fetchAll() async {
    return const [
      QuickPick(id: 1, title: "Yalnızlık Son Ses", artist: "Grogi", coverFileName: "yalnizliksonses.jpg"),
      QuickPick(id: 2, title: "Olur Mu", artist: "Gazapizm ve Melike Şahin", coverFileName: "olurmu.jpg"),
      QuickPick(id: 3, title: "Bensiz Yapama", artist: "Diyar Pala", coverFileName: "bensizyapama.jpg"),
      QuickPick(id: 4, title: "Bir Pesimistin Gözyaşları", artist: "Sagopa Kajmer", coverFileName: "birpesimistingozyaslari.jpg"),
      QuickPick(id: 5, title: "Criminal", artist: "Britney Spears", coverFileName: "criminal.jpg"),
      QuickPick(id: 6, title: "Siyah", artist: "Patron ve Sagopa Kajmer", coverFileName: "siyah.png"),
      QuickPick(id: 7, title: "Don't Speak", artist: "No Doubt", coverFileName: "dontspeak.jpg"),
      QuickPick(id: 8, title: "Mayıs 6", artist: "Rope", coverFileName: "mayis6.jpg"),
    ];
  }
}
