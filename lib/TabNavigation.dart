import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterstudy/community/community_page.dart';
import 'package:flutterstudy/discovery/discovery_page.dart';
import 'package:flutterstudy/home/home_page.dart';
import 'package:flutterstudy/mine/mine_page.dart';
import 'package:flutterstudy/rank/rank_page.dart';
import 'package:flutterstudy/util/constant.dart';
import 'package:flutterstudy/util/toast_util.dart';


class TabNavigation extends StatefulWidget {
  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  DateTime lastTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            body: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                  HomePage(),
                  CommunityPage(),
                  RankPage(),
                  MinePage()
              ],
            ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index){
                  _pageController.jumpToPage(index);
                 setState(() {
                    _currentIndex = index;
                 });
            },
            type: BottomNavigationBarType.fixed, //显示标题
            items: [
              _bottomItem("首页", 'images/ic_home_normal.png',
                  'images/ic_home_selected.png', 0),
              _bottomItem("社区", 'images/ic_discovery_normal.png',
                  'images/ic_discovery_selected.png', 1),
              _bottomItem("精品", 'images/ic_hot_normal.png',
                  'images/ic_hot_selected.png', 2),
              _bottomItem("我的", 'images/ic_mine_normal.png',
                  'images/ic_mine_selected.png', 3)
            ],
          ),
        ),
        onWillPop: _onWillPop);
  }

  Future<bool> _onWillPop() async {
    if (lastTime == null ||
        DateTime.now().difference(lastTime) > Duration(seconds: 2)) {
      lastTime = DateTime.now();
      ToastUtil.showTip(Constant.exit_tip);
      return false;
    } else {
      SystemNavigator.pop();
      return true;
    }
  }


  _bottomItem(String title, String normalIcon, String selectIcon, int index) {
    return BottomNavigationBarItem(
      icon: Image.asset(normalIcon, width: 24, height: 24),
      activeIcon: Image.asset(selectIcon, width: 24, height: 24),
      title: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(title,
              style: TextStyle(
                  color:
                  Color(_currentIndex == index ? 0xff000000 : 0xff9a9a9a),
                  fontSize: 14))),
    );
  }
}