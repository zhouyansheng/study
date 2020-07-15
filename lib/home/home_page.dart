
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterstudy/discovery/discovery_page.dart';
import 'package:flutterstudy/util/constant.dart';

const TEXT_HEADER_TYPE = 'textHeader';


const TAB_LABEL = ['发现', '精选', '日报'];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin,SingleTickerProviderStateMixin {

  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: TAB_LABEL.length, vsync: this);
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark, //设置状态栏字体颜色
//       appBar: AppBar(
//         title: Text("首页",
//           style:TextStyle(
//               fontSize: 18,
//               color: Colors.black,
//             fontWeight: FontWeight.bold
//           ),
//         ),
//         centerTitle:true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
      child: Column(
         children: <Widget>[
           Container(
             padding: EdgeInsets.only(top: 30,left: 80,right: 80),
             decoration: BoxDecoration(color: Colors.white),
             child: TabBar(
                 controller: _tabController,
                 labelColor: Colors.black,
                 unselectedLabelColor: Constant.hitTextColor,
                 labelStyle: TextStyle(fontSize: 14),
                 unselectedLabelStyle: TextStyle(fontSize: 14),
                 indicatorColor: Colors.black,
                 indicatorSize: TabBarIndicatorSize.label,
                 tabs: TAB_LABEL.map((String label) {
                   return Tab(text: label);
                 }).toList(),
                 onTap: (index) => _pageController.animateToPage(index,
                     duration: kTabScrollDuration, curve: Curves.ease)),
             ),
           Expanded(
             child: PageView(
               controller: _pageController,
               onPageChanged: (index) => _tabController.index = index,
               children: <Widget>[
                 DiscoveryPage(),
                 DiscoveryPage(),
                 DiscoveryPage()
               ],
             ),
           )
         ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
