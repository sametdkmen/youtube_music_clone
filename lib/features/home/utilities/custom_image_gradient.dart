// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomImageWithGradient extends StatelessWidget {
  final String imagePath;
  final double opacity;


  const CustomImageWithGradient({
    Key? key,
    required this.imagePath,
    required this.opacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Colors.transparent, Colors.black],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn, // Resmin üzerine efekti uygulayın
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: opacity,
            image: AssetImage(imagePath), // Resminizi buraya ekleyin
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
