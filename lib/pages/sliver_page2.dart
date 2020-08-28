import 'dart:math';

import 'package:flutter/material.dart';

class NestedPage extends StatefulWidget {
  @override
  _NestedPageState createState() => _NestedPageState();
}

class _NestedPageState extends State<NestedPage>
    with SingleTickerProviderStateMixin {
  var tabController;

  List<String> _tabs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabs = [
      "精选",
      "手机",
      "电脑",
      "日用",
      "服装",
      "精选",
      "手机",
      "电脑",
      "日用",
      "服装",
    ];
    tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            /// SliverAppBar
            SliverAppBar(
              expandedHeight: 200,
              title: Text("NestedScrollView"),
              centerTitle: true,
              pinned: true,
            ),

            /// SliverList
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 55,
                color: Color.fromRGBO(Random().nextInt(256),
                    Random().nextInt(256), Random().nextInt(256), 1),
                child: Center(
                  child: Text("SliverList--$index"),
                ),
              );
            }, childCount: 5)),

            /// SliverPersistentHeader
            SliverPersistentHeader(
              pinned: true,
              delegate: PersistentDelegate(
                  child: Material(
                color: Colors.blue,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  controller: this.tabController,
                  tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                ),
              )),
            ),


          ];
        },
        body: TabBarView(
            controller: this.tabController,
            children: _tabs.map((value) {
              return Container(
                  child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Color.fromRGBO(Random().nextInt(256),
                              Random().nextInt(256), Random().nextInt(256), 1),
                          height: 55,
                          child: Center(
                              child: Text(
                                  "${value.toString()}---TabBarView-$index")),
                        );
                      }));
            }).toList()),
      ),
    );
  }
}

class PersistentDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  PersistentDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 48;

  @override
  // TODO: implement minExtent
  double get minExtent => 48;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}
