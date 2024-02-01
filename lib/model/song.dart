import 'package:flutter/material.dart';

@immutable
class Song {
  final int id;
  final String songName;
  final String imageName;
  final String singerName;

  const Song({
    required this.id,
    required this.songName,
    required this.imageName,
    required this.singerName,
  });

  static Future<List<Song>> getMusicList(
      {int fetchMilliSecondTime = 2000}) async {
    List<Song> musicList = <Song>[];

    const Song m1 = Song(
        id: 1,
        songName: "Seni Dert Etmeler",
        imageName: "senidertetmeler.jpg",
        singerName: "Madrigal");
    const Song m2 = Song(
        id: 2,
        songName: "Gecenin İçine Gir",
        imageName: "geceninicinegir.png",
        singerName: "Uzi & Mavi");
    const Song m3 = Song(
        id: 3,
        songName: "Sarılırım Birine",
        imageName: "sarilirimbirine.jpg",
        singerName: "Adamlar");
    const Song m4 = Song(
        id: 4,
        songName: "Siyah",
        imageName: "siyah.png",
        singerName: "Sagopa Kajmer");
    const Song m5 = Song(
        id: 5,
        songName: "Unutulanlar",
        imageName: "unutulanlar.jpg",
        singerName: "Farazi & Kayra");
    const Song m6 = Song(
        id: 6,
        songName: "Don't Speak",
        imageName: "dontspeak.jpg",
        singerName: "No Doubt");
    const Song m7 = Song(
        id: 7,
        songName: "Mayıs 6",
        imageName: "mayıs6.jpg",
        singerName: "Rope");
    const Song m8 = Song(
        id: 8,
        songName: "Yalnızlık Son Ses",
        imageName: "yalnizliksonses.jpg",
        singerName: "Grogi");
    const Song m9 = Song(
        id: 9,
        songName: "Kor",
        imageName: "kor.jpg",
        singerName: "Emir Can İğrek");
    const Song m10 = Song(
        id: 10,
        songName: "Baytar",
        imageName: "baytar.jpg",
        singerName: "Sagopa Kahjmer");
    const Song m11 = Song(
        id: 11,
        songName: "Affet",
        imageName: "affet.jpg",
        singerName: "Müslüm Gürses");
    const Song m12 = Song(
        id: 12,
        songName: "everything i wanted",
        imageName: "everythingiwanted.jpg",
        singerName: "Billie Ellish");

    musicList.add(m1);
    musicList.add(m2);
    musicList.add(m3);
    musicList.add(m4);
    musicList.add(m5);
    musicList.add(m6);
    musicList.add(m7);
    musicList.add(m8);
    musicList.add(m9);
    musicList.add(m10);
    musicList.add(m11);
    musicList.add(m12);

    return await Future.delayed(Duration(milliseconds: fetchMilliSecondTime))
        .then((value) => musicList);
  }

  static Future<List<Song>> fetchQuickPickList(
      {int fetchMilliSecondTime = 2000}) async {
    List<Song> quickPicks = <Song>[];

    const Song h1 = Song(
        id: 1,
        songName: "Yalnızlık Son Ses",
        singerName: "Grogi",
        imageName: "yalnizliksonses.jpg");
    const Song h2 = Song(
        id: 2,
        songName: "Olur Mu",
        singerName: "Gazapizm ve Melike Şahin",
        imageName: "olurmu.jpg");
    const Song h3 = Song(
        id: 3,
        songName: "Bensiz Yapama",
        singerName: "Diyar Pala",
        imageName: "bensizyapama.jpg");
    const Song h4 = Song(
        id: 4,
        songName: "Bir Pesimistin Gözyaşları",
        singerName: "Sagopa Kajmer",
        imageName: "birpesimistingozyaslari.jpg");
    const Song h5 = Song(
        id: 5,
        songName: "Criminal",
        singerName: "Britney Spears",
        imageName: "criminal.jpg");
    const Song h6 = Song(
        id: 6,
        songName: "Siyah",
        singerName: "Patron ve Sagopa Kajmer",
        imageName: "siyah.png");
    const Song h7 = Song(
        id: 7,
        songName: "Don't Speak",
        singerName: "No Doubt",
        imageName: "dontspeak.jpg");
    const Song h8 = Song(
        id: 8,
        songName: "Mayıs 6",
        singerName: "Rope",
        imageName: "mayıs6.jpg");

    quickPicks.add(h1);
    quickPicks.add(h2);
    quickPicks.add(h3);
    quickPicks.add(h4);
    quickPicks.add(h5);
    quickPicks.add(h6);
    quickPicks.add(h7);
    quickPicks.add(h8);

    return await Future.delayed(Duration(milliseconds: fetchMilliSecondTime))
        .then((value) => quickPicks);
  }
}