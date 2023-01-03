class HizliSecimler {
  int id;
  String ad;
  String sanatci;
  String resimAdi;

  HizliSecimler(this.id, this.ad, this.sanatci, this.resimAdi);

  static Future<List<HizliSecimler>> hizliSecimGetir() async {
    var hizliSecimler = <HizliSecimler>[];

    var h1 = HizliSecimler(1, "Yalnızlık Son Ses", "Grogi", "yalnizliksonses.jpg");
    var h2 = HizliSecimler(2, "Olur Mu", "Gazapizm ve Melike Şahin", "olurmu.jpg");
    var h3 = HizliSecimler(3, "Bensiz Yapama", "Diyar Pala", "bensizyapama.jpg");
    var h4 = HizliSecimler(4, "Bir Pesimistin Gözyaşları", "Sagopa Kajmer", "birpesimistingozyaslari.jpg");
    var h5 = HizliSecimler(5, "Criminal", "Britney Spears", "criminal.jpg");
    var h6 = HizliSecimler(6, "Siyah", "Patron ve Sagopa Kajmer", "siyah.png");
    var h7 = HizliSecimler(7, "Don't Speak", "No Doubt", "dontspeak.jpg");
    var h8 = HizliSecimler(8, "Mayıs 6", "Rope", "mayıs6.jpg");


    hizliSecimler.add(h1);
    hizliSecimler.add(h2);
    hizliSecimler.add(h3);
    hizliSecimler.add(h4);
    hizliSecimler.add(h5);
    hizliSecimler.add(h6);
    hizliSecimler.add(h7);
    hizliSecimler.add(h8);

    return hizliSecimler;
  }
}