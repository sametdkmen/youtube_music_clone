import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_music_app/buton2.dart';
import 'package:youtube_music_app/ust_butonlar.dart';
import 'package:youtube_music_app/hizli_secimler_widget.dart';
import 'package:youtube_music_app/muzikler.dart';
import 'package:youtube_music_app/listeler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double mcheight = 0;
  double mcwidth = 0;
  double logoheight = 0;
  double hsheight = 0;
  double rdyextent = 0;
  double ustbtnheight = 0;

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context).size;
    final double ekranGenisligi = ekranBilgisi.width;
    final double ekranYuksekligi = ekranBilgisi.height;
    print("Ekran genişliği : $ekranGenisligi");
    print("Ekran yüksekliği : $ekranYuksekligi");

    if (ekranYuksekligi >= 700){
      mcheight = 2.9;
      logoheight = 26;
      hsheight = 3.5;
      rdyextent = 386; //pocof1 ideal 386
      ustbtnheight = 24;

    }
    else{
      mcheight = 2.44;
      logoheight = 24;
      hsheight = 2.8;
      rdyextent = 400; //pixel 2 emulator ideal 400
      ustbtnheight = 22;

    }

    if (ekranGenisligi >= 400 && ekranYuksekligi >= 670){
    }
    else
    {
      rdyextent = 385; //huawei mate 8 ideal
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: SizedBox(
            child: SvgPicture.asset(
              'images/logo/white_logo.svg',
              height: 25,
              fit: BoxFit.cover,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.cast),
              onPressed: () {
                print("Cast tıklandı.");
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                print("Arama tıklandı.");
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle_sharp),
              onPressed: () {
                print("Profil tıklandı.");
              },
            ),
          ],
        ), //APPBAR - LOGO - ARAMA - PROFİL
      body: SingleChildScrollView( //KAYDIRABİLME EKLEDİM.
        child: Center(
          child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('images/logo/gradient_bg.png'),
                fit: BoxFit.cover,
                opacity: 100,
                alignment: Alignment.centerRight,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: List.generate(ustButton.length, (index) {
                      return Container(
                        padding: const EdgeInsets.only(left: 8),
                        child: SizedBox(
                          height: ekranYuksekligi / ustbtnheight,
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: (){
                                  print("${ustButton[index]} tıklandı.");
                                },
                                style: TextButton.styleFrom(
                                  side: BorderSide(
                                    width: 0.8, //dış kenarlık kalınlığı
                                    color: Colors.grey.withAlpha(50),),
                                  backgroundColor: Colors.white24.withAlpha(38),
                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                  alignment: Alignment.center,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(ustButton[index],style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      overflow: TextOverflow.visible,
                                      letterSpacing: 0.6,
                                      fontFamily: "RobotoLight",
                                      fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ), //ÜST BUTONLAR
              const SizedBox(
                height: 15,
              ),
              Container(
                height: ekranYuksekligi/ 12, // /10 emulator.
                width: ekranGenisligi,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("BİR ŞARKIDAN RADYO BAŞLATIN",style: TextStyle(fontSize: 14,color: Colors.white54,fontWeight: FontWeight.w400),),
                      SizedBox(height: 2,
                      ),
                      Text("Hızlı seçimler",style: TextStyle(fontSize: 25,fontFamily: "YoutubeSansSemibold",fontWeight: FontWeight.w700,color: Colors.white),),
                    ],
                  ),
                ),
              ),  // BİR ŞARKIDAN RADYO BAŞLATIN
              Container(
                color: Colors.transparent,
                height: ekranYuksekligi / hsheight, //2.4 emu.  //3 poco
                child: FutureBuilder<List<HizliSecimler>>(
                  future: HizliSecimler.hizliSecimGetir(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      var hizliSecimListesi = snapshot.data;
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 0,
                          mainAxisExtent: rdyextent,
                        ),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        itemCount: hizliSecimListesi!.length,
                        itemBuilder: (context,indeks){
                          var hizliSecimNesnesi = hizliSecimListesi[indeks];
                          return Container(
                            color: Colors.transparent,
                            height: 62,
                            width: ekranGenisligi,
                            alignment: Alignment.center,
                            child: ListTile(
                              onTap: (){
                                print("${hizliSecimNesnesi.ad} çalınıyor..");
                                },
                              leading: Container(height: 47, width: 47,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(image: AssetImage("images/sarki_kapaklari/${hizliSecimNesnesi.resimAdi}",),
                                  ),),
                              ), //47,47 ideal ayar.
                              title:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(hizliSecimNesnesi.ad,style: const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  Text(hizliSecimNesnesi.sanatci,style: const TextStyle(color: Colors.white54,fontSize: 12,fontWeight: FontWeight.w500),),
                                ],
                              ),
                              trailing: IconButton(
                                iconSize: 18,
                                highlightColor: Colors.white, //tıklanıldığında ki renk
                                alignment: Alignment.center,
                                onPressed: (){},
                                icon: const Icon(Icons.more_vert_rounded),
                                color: Colors.white54,
                              ),
                            ),
                          );
                        },
                      );
                    }
                    else
                    {
                      return const Center();
                    }
                  },
                ),
              ), // HIZLI SEÇİMLER * MÜZİKLER
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: SizedBox(
                  height: 44,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Yeniden dinleyin",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: "YoutubeSansSemibold",fontWeight: FontWeight.w700),),
                      Buton2(),
                    ],
                  ),
                ),
              ), // YENİDEN DİNLEYİN - DİĞER BUTONU
              const SizedBox(
                height: 14,
              ),
              Container(
                color: Colors.transparent,
                height: ekranYuksekligi / mcheight, //emu : 683.428 / 2.36 =  289,588   || //pocof1 : 816.7272 / 2.5 = 327,090
                child: FutureBuilder<List<Muzikler>>(
                  future: Muzikler.muzikleriGetir(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      var muzikListesi = snapshot.data;
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: muzikListesi!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 0,
                            mainAxisExtent: 100, //bu ozellıge bakılacak. burada kaldım......
                            mainAxisSpacing: 13,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context,indeks){
                          var muzikNesnesi = muzikListesi[indeks];
                          return Container(
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 98,
                                      height: 98,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.asset("images/sarki_kapaklari/${muzikNesnesi.resimAdi}"),
                                        ),
                                    ),
                                   const Icon(Icons.play_arrow,color: Colors.white,size: 30),
                                ],
                                ),
                                const SizedBox(
                                  height: 6.5,
                                ),
                                Text(muzikNesnesi.ad,style: const TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    else
                      {
                        return const Center();
                      }
                  },
                ),
              ), // MÜZİKLER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Sizin için derlenenler",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: "YoutubeSansSemibold",fontWeight: FontWeight.w700),),
                    Buton2(),
                  ],
                ),
              ), // SİZİN İÇİN DERLENENLER - DİĞER BUTONU
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.8,
                width: ekranGenisligi,
                child: FutureBuilder<List<Listeler>>(
                  future: Listeler.listeleriGetir(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      var calmaListesi = snapshot.data;
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: calmaListesi!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, //bir satırda gösterilecek eleman sayısı
                            mainAxisExtent: 140, //uzunluğunu, kapsamını veriyorum.
                            mainAxisSpacing: 2, //aralarındaki boşluk
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context,indeks){
                          var listeNesnesi = calmaListesi[indeks];
                          return Container(
                            color: Colors.transparent,
                            height: MediaQuery.of(context).size.height / 2.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                width: 120,
                                height: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.asset("images/${listeNesnesi.resimAdi}"),
                                ),
                              ),
                                const SizedBox(height: 6.5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(listeNesnesi.liste_adi,style: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                                    const SizedBox(
                                      height: 3,),
                                    Wrap(
                                      children: [ Text(listeNesnesi.aciklama,style: const TextStyle(color: Colors.white60,fontSize: 10),),
                                    ], //Wrap ile sarmaladık alt satıra düzgün şekilde geçsin diye.
                                  ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    else
                    {
                      return const Center();
                    }
                  },
                ),
              ), // PLAYLİSTLER
            ],
          ),
            ),
        ), //ARKAPLAN
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey.withAlpha(15),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          currentIndex: 0, //Anasayfa
          items:const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Ana Sayfa"),
          BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.compass_fill),
              icon: Icon(CupertinoIcons.compass),label: "Keşfet"),
          BottomNavigationBarItem(icon: Icon(Icons.library_music_outlined),activeIcon: Icon(Icons.library_music),label: "Kitaplık"),
          ],
      ), //ALT DÜĞMELER
    );
  }
}
