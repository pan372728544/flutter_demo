import 'package:flutter/material.dart';

class SliverPage extends StatefulWidget {
  final Map arguments;
  SliverPage({Key key, this.arguments}) : super(key: key);

  @override
  _SliverPageState createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Sliver-Demo")),
      body: CustomScrollView(
        slivers: <Widget>[
          /// SliverAppBar
          SliverAppBar(
            backgroundColor: Colors.blue,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.ac_unit), onPressed: null),
              IconButton(icon: Icon(Icons.search), onPressed: null)
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text("FlexibleSpaceBar"),
              background: FlutterLogo(),
            ),
            expandedHeight: 100,
            pinned: true,
          ),

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
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.0)),

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
        ],
      ),
    );
  }
}
