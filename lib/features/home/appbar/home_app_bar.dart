import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_music_clone/core/constant/color_constant.dart';

class HomeAppBar extends StatelessWidget {
  final double dynamicOpacity;

  const HomeAppBar({super.key, required this.dynamicOpacity});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: dynamicOpacity + .5,
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset(
          'assets/images/logo/white_logo.svg',
          height: 25,
          fit: BoxFit.cover,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            splashColor: ColorConstant.instance.appSplashColor,
            onPressed: () {
              debugPrint("Arama tıklandı.");
            },
          ),
          IconButton(
            icon: const CircleAvatar(
              radius: 13,
              backgroundImage: AssetImage("assets/images/profile/avatar.png"),
            ),
            splashColor: ColorConstant.instance.appSplashColor,
            onPressed: () {
              debugPrint("Profil tıklandı.");
            },
          ),
        ],
      ),
    );
    //bottom: const UpChip());
  }
}
