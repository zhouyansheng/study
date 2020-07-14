import 'package:flutter/material.dart';

class RankPage extends StatefulWidget {
  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.white);
  }


  @override
  bool get wantKeepAlive => true;
}
