import 'package:flutter/material.dart';
import 'package:youtube_music_app/core/constant/color_constant.dart';
import 'package:youtube_music_app/core/extension/context_extension.dart';

class OtherButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonTxt;

  const OtherButton({super.key, this.onTap, this.buttonTxt = "Diğer"});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.027),
      width: buttonTxt != "Diğer" ? null : context.dynamicWidth(0.11),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: ColorConstant.instance.appSplashColor,
          backgroundColor: Colors.transparent,
          alignment: Alignment.center,
          side: BorderSide(
            width: 0.8,
            color: Colors.grey.withAlpha(100),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
        ),
        child: Text(
          buttonTxt,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              height: 1,
              fontSize: context.dynamicWidth(0.02)),
          overflow: TextOverflow.visible, //yazıyı kesilmeden gösterdik.
        ),
      ),
    );
  }
}
