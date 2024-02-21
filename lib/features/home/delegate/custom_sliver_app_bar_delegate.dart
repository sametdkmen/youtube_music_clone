// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../view/home_view.dart';

class _CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double statusBarHeight;
  _CustomSliverAppBarDelegate(
    this.statusBarHeight,
  );

  @override
  double get minExtent => kBottomNavigationBarHeight;
  @override
  double get maxExtent => kBottomNavigationBarHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarColorTween =
        ColorTween(begin: Colors.transparent, end: Colors.black);

    final appBarColorTweenBottom =
        ColorTween(begin: Colors.transparent, end: Colors.grey.shade200);

    /// Header Dynamic Background Color And Bottom Color
    final relativeScroll = min(shrinkOffset, maxExtent) / (minExtent / 1.2);

    return Container(
      decoration: BoxDecoration(
          color: appBarColorTween.transform(relativeScroll),
          border: Border.merge(
              Border(
                  bottom: BorderSide(
                      width: 0.12,
                      color: appBarColorTweenBottom.transform(relativeScroll) ??
                          Colors.transparent)),
              Border(
                  bottom: BorderSide(
                      width: 0.00,
                      color: appBarColorTweenBottom.transform(relativeScroll) ??
                          Colors.transparent)))),
      child: const UpChip(),
    );
  }

  @override
  bool shouldRebuild(_CustomSliverAppBarDelegate oldDelegate) {
    return false;
  }
}
