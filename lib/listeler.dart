class Listeler{
  int id;
  String liste_adi;
  String aciklama;
  String resimAdi;

  Listeler({required this.id,required this.liste_adi,required this.aciklama,required this.resimAdi});


  static Future<List<Listeler>> listeleriGetir() async {
    var calmaListeleri = <Listeler>[];

    var l1 = Listeler(id: 1, liste_adi: "Supermix'im", aciklama: "Gazapizm, UZI, Ezhel",resimAdi: "mixart.jpg");
    var l2 = Listeler(id: 2, liste_adi: "Karışık Listem 1",aciklama: "Sagopa Kajmer, Lil Zey",resimAdi: "mixart2.jpg");
    var l3 = Listeler(id: 3, liste_adi: "Karışık Listem 2",aciklama: "İlyas Yalçıntaş, Sezen Aksu",resimAdi: "mixart3.jpg");
    var l4 = Listeler(id: 4, liste_adi: "2022 Recap",aciklama: "Oynatma listesi • Senin için oluşturuldu",resimAdi: "recap.png");
    var l5 = Listeler(id: 5, liste_adi: "Pop 100",aciklama: "En Popüler 100 Şarkı",resimAdi: "pop100.png");
    var l6 = Listeler(id: 6, liste_adi: "Beğendikleriniz", aciklama: "Otomatik oynatma listesi", resimAdi: "liked.png");
    calmaListeleri.add(l1);
    calmaListeleri.add(l2);
    calmaListeleri.add(l3);
    calmaListeleri.add(l4);
    calmaListeleri.add(l5);
    calmaListeleri.add(l6);

    return calmaListeleri;
  }

}