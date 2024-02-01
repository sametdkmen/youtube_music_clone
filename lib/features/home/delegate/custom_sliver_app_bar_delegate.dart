part of '../view/home_view.dart';

class _CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _CustomSliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarColorTween =
        ColorTween(begin: Colors.transparent, end: Colors.black);

    final relativeScroll = min(shrinkOffset, maxExtent) / minExtent;

    return Container(
      color: appBarColorTween.transform(relativeScroll),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_CustomSliverAppBarDelegate oldDelegate) {
    return false;
  }
}
