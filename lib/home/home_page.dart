
import 'package:flutter/material.dart';

const TEXT_HEADER_TYPE = 'textHeader';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.white);
  }

  @override
  bool get wantKeepAlive => true;
}
