import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

}