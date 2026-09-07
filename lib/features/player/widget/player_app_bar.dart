import 'package:flutter/material.dart';

/// Top row of the player: collapse button, "Şarkı / Video" segmented toggle
/// and the overflow menu.
class PlayerAppBar extends StatefulWidget implements PreferredSizeWidget {
  const PlayerAppBar({super.key});

  @override
  State<PlayerAppBar> createState() => _PlayerAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}

class _PlayerAppBarState extends State<PlayerAppBar> {
  bool isVideoMode = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        _SegmentedToggle(
          leftLabel: 'Şarkı',
          rightLabel: 'Video',
          isRightSelected: isVideoMode,
          onChanged: (value) => setState(() => isVideoMode = value),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_outlined, color: Colors.white),
        ),
      ],
    );
  }
}

/// Two-option pill toggle in the style of YouTube Music's "Song / Video"
/// switch: a translucent track with a white thumb sliding under the
/// selected label.
class _SegmentedToggle extends StatelessWidget {
  final String leftLabel;
  final String rightLabel;
  final bool isRightSelected;
  final ValueChanged<bool> onChanged;

  const _SegmentedToggle({
    required this.leftLabel,
    required this.rightLabel,
    required this.isRightSelected,
    required this.onChanged,
  });

  static const double _segmentWidth = 72;
  static const double _height = 32;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    return Container(
      height: _height,
      width: _segmentWidth * 2,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(_height / 2),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            alignment: isRightSelected ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: _segmentWidth - 3,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(_height / 2),
              ),
            ),
          ),
          Row(
            children: [
              _segment(leftLabel, !isRightSelected, () => onChanged(false), textStyle),
              _segment(rightLabel, isRightSelected, () => onChanged(true), textStyle),
            ],
          ),
        ],
      ),
    );
  }

  Widget _segment(String label, bool selected, VoidCallback onTap, TextStyle? style) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(_height / 2),
        onTap: onTap,
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: (style ?? const TextStyle()).copyWith(
              color: selected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600,
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
