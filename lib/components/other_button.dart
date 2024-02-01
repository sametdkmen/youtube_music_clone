import 'package:flutter/material.dart';
import 'package:youtube_music_app/core/extension/context_extension.dart';

class OtherButton extends StatelessWidget {
  const OtherButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.028),
      width: context.dynamicWidth(0.11),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            width: 0.8,
            color: Colors.grey.withAlpha(100),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
        ),
        child: Text(
          "Diğer",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
              height: 1,
              fontSize: context.dynamicWidth(0.02)),
          overflow: TextOverflow.visible, //yazıyı kesilmeden gösterdik.
        ),
      ),
    );
  }
}
