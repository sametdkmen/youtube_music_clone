class Muzikler{
  int id;
  String ad;
  String resimAdi;

  Muzikler({required this.id,required this.ad,required this.resimAdi});

    static Future<List<Muzikler>> muzikleriGetir() async {
    var muzikListesi = <Muzikler> [];


    var m1 = Muzikler(id: 1, ad: "Seni Dert Etmeler", resimAdi: "senidertetmeler.jpg");
    var m2 = Muzikler(id: 2, ad: "Gecenin İçine Gir", resimAdi: "geceninicinegir.png");
    var m3 = Muzikler(id: 3, ad: "Sarılırım Birine", resimAdi: "sarilirimbirine.jpg");
    var m4 = Muzikler(id: 4, ad: "Siyah", resimAdi: "siyah.png");
    var m5 = Muzikler(id: 5, ad: "Unutulanlar", resimAdi: "unutulanlar.jpg");
    var m6 = Muzikler(id: 6, ad: "Don't Speak", resimAdi: "dontspeak.jpg");
    var m7 = Muzikler(id: 7, ad: "Mayıs 6", resimAdi: "mayıs6.jpg");
    var m8 = Muzikler(id: 8, ad: "Yalnızlık Son Ses", resimAdi: "yalnizliksonses.jpg");
    var m9 = Muzikler(id: 9, ad: "Kor", resimAdi: "kor.jpg");
    var m10 = Muzikler(id: 10, ad: "Baytar", resimAdi: "baytar.jpg");
    var m11 = Muzikler(id: 11, ad: "Affet", resimAdi: "affet.jpg");
    var m12 = Muzikler(id: 12, ad: "everything i wanted", resimAdi: "everythingiwanted.jpg");
    muzikListesi.add(m1);
    muzikListesi.add(m2);
    muzikListesi.add(m3);
    muzikListesi.add(m4);
    muzikListesi.add(m5);
    muzikListesi.add(m6);
    muzikListesi.add(m7);
    muzikListesi.add(m8);
    muzikListesi.add(m9);
    muzikListesi.add(m10);
    muzikListesi.add(m11);
    muzikListesi.add(m12);

    return muzikListesi;
  }
}