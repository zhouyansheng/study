

import 'package:flutter/cupertino.dart';
import 'package:flutterstudy/model/issue_model.dart';

class RankWidgetItem extends StatelessWidget{
  final Item item;
  final bool showCategory;
  final bool showDivider;


  const RankWidgetItem(
      {Key key, this.item, this.showCategory = true, this.showDivider = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

  }
}