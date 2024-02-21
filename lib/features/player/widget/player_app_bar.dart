import 'package:flutter/material.dart';

class PlayerAppBar extends StatefulWidget implements PreferredSizeWidget {
  const PlayerAppBar({super.key});

  @override
  State<PlayerAppBar> createState() => _PlayerAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}

class _PlayerAppBarState extends State<PlayerAppBar> {
  bool changeType = false;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [
          Text(
            'Şarkı',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
          ),
          Switch(
              value: changeType,
              onChanged: ((value) {
                setState(() {
                  changeType = !changeType;
                });
              })),
          Text(
            'Video',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
      IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_outlined, color: Colors.white))
    ]);
  }
}