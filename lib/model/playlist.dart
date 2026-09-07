import 'package:flutter/material.dart';

@immutable
class PlayList {
  final int id;
  final String listName;
  final String description;
  final String imageName;

  const PlayList(
      {required this.id,
      required this.listName,
      required this.description,
      required this.imageName});

  static List<PlayList> mockPlayList = [
    const PlayList(
        id: 1,
        listName: "Supermix'im",
        description: "Gazapizm, UZI, Ezhel",
        imageName: "mixart.jpg"),
    const PlayList(
        id: 2,
        listName: "Karışık Listem 1",
        description: "Sagopa Kajmer, Lil Zey",
        imageName: "mixart2.jpg"),
    const PlayList(
        id: 3,
        listName: "Karışık Listem 2",
        description: "İlyas Yalçıntaş, Sezen Aksu",
        imageName: "mixart3.jpg"),
    const PlayList(
        id: 4,
        listName: "2022 Recap",
        description: "Oynatma listesi • Senin için oluşturuldu",
        imageName: "recap.png"),
    const PlayList(
        id: 5,
        listName: "Pop 100",
        description: "En Popüler 100 Şarkı",
        imageName: "pop100.png"),
    const PlayList(
        id: 6,
        listName: "Beğendikleriniz",
        description: "Otomatik oynatma listesi",
        imageName: "liked.png")
  ];

  static Future<List<PlayList>> getPlayList(
      {int fetchMilliSecondTime =  2000}) async {
    List<PlayList> playLists = <PlayList>[];

    const PlayList l1 = PlayList(
        id: 1,
        listName: "Supermix'im",
        description: "Gazapizm, UZI, Ezhel",
        imageName: "mixart.jpg");
    const PlayList l2 = PlayList(
        id: 2,
        listName: "Karışık Listem 1",
        description: "Sagopa Kajmer, Lil Zey",
        imageName: "mixart2.jpg");
    const PlayList l3 = PlayList(
        id: 3,
        listName: "Karışık Listem 2",
        description: "İlyas Yalçıntaş, Sezen Aksu",
        imageName: "mixart3.jpg");
    const PlayList l4 = PlayList(
        id: 4,
        listName: "2022 Recap",
        description: "Oynatma listesi • Senin için oluşturuldu",
        imageName: "recap.png");
    const PlayList l5 = PlayList(
        id: 5,
        listName: "Pop 100",
        description: "En Popüler 100 Şarkı",
        imageName: "pop100.png");
    const PlayList l6 = PlayList(
        id: 6,
        listName: "Beğendikleriniz",
        description: "Otomatik oynatma listesi",
        imageName: "liked.png");

    playLists.add(l1);
    playLists.add(l2);
    playLists.add(l3);
    playLists.add(l4);
    playLists.add(l5);
    playLists.add(l6);
    return await Future.delayed(Duration(milliseconds: fetchMilliSecondTime)).then((value) => playLists);
  }
}
