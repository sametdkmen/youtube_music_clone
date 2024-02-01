import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: SvgPicture.asset(
        'images/logo/white_logo.svg',
        height: 25,
        fit: BoxFit.cover,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.cast),
          onPressed: () {
            debugPrint("Cast tıklandı.");
          },
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            debugPrint("Arama tıklandı.");
          },
        ),
        IconButton(
          icon: const Icon(Icons.account_circle_sharp),
          onPressed: () {
            debugPrint("Profil tıklandı.");
          },
        ),
      ],
    );
    //bottom: const UpChip());
  }
}
