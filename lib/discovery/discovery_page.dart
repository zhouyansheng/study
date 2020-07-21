import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterstudy/discovery/rank_widget_item.dart';
import 'package:flutterstudy/model/issue_model.dart';
import 'package:flutterstudy/provider/discover_model.dart';
import 'package:flutterstudy/widget/loading_container.dart';
import 'package:flutterstudy/widget/provider_widget.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const TEXT_HEADER_TYPE = 'textHeader';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: ProviderWidget<DiscoverPageModel>(
            model: DiscoverPageModel(),
            onModelInit: (model) {
              model.refresh();
            },
            builder: (context,model,child){
                return LoadingContainer(
                  loading: model.loading,
                   child: SmartRefresher(
                     controller: model.refreshController,
                     onRefresh: model.refresh,
                     onLoading: model.loadMore,
                     enablePullUp: true,
                     child: ListView.separated(
                         itemBuilder: (context,index){
                            if(index == 0){
                              return _banner(context);
                            }else{
                              if (model.itemList[index].type ==
                                  "textHeader") {
                                return _titleItem(model.itemList[index]);
                              }
                              return RankWidgetItem(item: model.itemList[index]);
                            }
                         },
                         separatorBuilder: (context, index) {
                           return Padding(
                               padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                               child: Divider(
                                   height: model.itemList[index].type ==
                                       TEXT_HEADER_TYPE ||
                                       index == 0
                                       ? 0
                                       : 0.5,
                                   color: model.itemList[index].type ==
                                       TEXT_HEADER_TYPE ||
                                       index == 0
                                       ? Colors.transparent
                                       : Color(0xffe6e6e6)));
                         },
                         itemCount: model.itemList.length),
                   ),
                );
            }),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _banner(BuildContext context) {
    DiscoverPageModel model = Provider.of(context);
    return Container(
      height: 180,
      padding: EdgeInsets.all(15),
      child: Stack(
        children: <Widget>[
          Swiper(
            autoplay: true,
            itemBuilder: (BuildContext context,int index) {
              return Hero(
                  tag:
                  '${model.bannerList[index].data.id}${model.bannerList[index].data.time}',
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                model.bannerList[index].data.cover.feed),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(4)),
                  ));
            },
            onIndexChanged: (index) {
              model.changeBannerIndex(index);
            },
            onTap: (index) {

            },
          itemCount: model.bannerList?.length ?? 0,
          pagination: new SwiperPagination(
              alignment: Alignment.bottomRight,
              builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.white, color: Colors.white24))),

          Positioned(
              width: MediaQuery.of(context).size.width - 30,
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4))),
                  child: Text(model.bannerList[model.currentIndex].data.title,
                      style: TextStyle(color: Colors.white, fontSize: 12))))
        ],
      ),
    );
  }

  Widget _titleItem(Item itemList) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.all(15),
      child: Center(
        child: Text(itemList.data.text,
            style: TextStyle(color: Colors.black, fontSize: 12)
        ),
      ),
    );
  }
}

