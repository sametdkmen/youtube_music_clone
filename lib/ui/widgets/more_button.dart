import 'package:flutter/material.dart';

/// Small outlined "Diğer" (More) button placed next to section titles.
class MoreButton extends StatelessWidget {
  const MoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 47,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          side: BorderSide(
            width: 0.8,
            color: Colors.grey.withAlpha(100),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        child: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Diğer",
            maxLines: 1,
            softWrap: false,
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              fontFamily: "YoutubeSansRegular",
            ),
          ),
        ),
      ),
    );
  }
}
