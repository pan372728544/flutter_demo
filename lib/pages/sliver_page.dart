import 'package:flutter/material.dart';

class SliverPage extends StatefulWidget {
  final Map arguments;

  SliverPage({Key key, this.arguments}) : super(key: key);

  @override
  _SliverPageState createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage>
    with SingleTickerProviderStateMixin {
  var tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       appBar: AppBar(title: Text("Sliver-Demo")),
      body: CustomScrollView(
        slivers: <Widget>[
          /// SliverAppBar
          SliverAppBar(
            actions: <Widget>[
              IconButton(icon: Icon(Icons.ac_unit), onPressed: null),
              IconButton(icon: Icon(Icons.search), onPressed: null)
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text("FlexibleSpaceBar"),
              background: FlutterLogo(),
            ),
             expandedHeight: 150,
//            pinned: true,
          ),

          /// SliverPersistentHeader
          SliverPersistentHeader(
            pinned: true,
            delegate: PersistentDelegate(
              child: Material(
                color: Colors.blue,
                child: TabBar(
                  labelColor: Colors.black,
                  controller: this.tabController,
                  tabs: <Widget>[
                    Tab(text: "Home",),
                    Tab(text: 'SETTING'),
                  ],
                ),
              )
            ),
          ),


          /// SliverToBoxAdapter
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              child: TabBarView(controller: this.tabController, children: [
                Container(
                  color: Colors.red,
                  child: Center(
                    child: Text("HOME"),
                  ),
                ),
                Container(
                  color: Colors.yellow,
                  child: Center(
                    child: Text("SETTING"),
                  ),
                ),
              ]),
            ),
          ),

          /// SliverToBoxAdapter包含ListView，滑动会出现问题，可以使用NestedScrollview解决
          SliverToBoxAdapter(
              child: ListView.builder(
                shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.green,
                child: Center(
                  child: Text("ListView-$index"),
                ),
              );
            },
            itemCount: 8,
          )),

          /// SliverGrid
          SliverGrid(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  color: Colors.teal[100 * (index % 9)],
                  child: Center(child: Text("Grid Item $index")),
                );
              }, childCount: 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 1.0)),

          /// SliverFixedExtentList
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            }, childCount: 6),
          ),

          /// SliverToBoxAdapter
          SliverToBoxAdapter(
            child: Container(
                height: 55,
                color: Colors.green,
                child: Center(
                  child: Text("SliverToBoxAdapter"),
                )),
          ),

          /// SliverFillRemaining
          SliverFillRemaining(
            child: Container(
              child: Center(
                child: Text("填充剩余的部分"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PersistentDelegate extends SliverPersistentHeaderDelegate {
  final Material child;

  PersistentDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Center(child: this.child);
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
