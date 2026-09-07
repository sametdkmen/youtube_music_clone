import 'package:flutter/material.dart';
import 'package:youtube_music_clone/core/constant/color_constant.dart';

class OtherButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonTxt;

  const OtherButton({super.key, this.onTap, this.buttonTxt = "Diğer"});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: ColorConstant.instance.appSplashColor,
          backgroundColor: Colors.transparent,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: BorderSide(
            width: 0.8,
            color: Colors.grey.withAlpha(100),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            buttonTxt,
            maxLines: 1,
            softWrap: false,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white, height: 1, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
