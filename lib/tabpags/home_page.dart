import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _list = [
    {"title": "provider的使用", "url": "/provider", "params": {'id':"4.3.2"}},
    {"title": "sliver-CustomScrollView", "url": "/sliver","params":{}},
    {"title": "sliver-NestedScrollView", "url": "/sliver2","params":{}},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            Map info = _list[index];
            return GestureDetector(
                onTap: () {
 
                  if ((info["params"] as Map).isNotEmpty) {
                    /// 路由跳转页面 传递参数
                    Navigator.pushNamed(context, info["url"],
                        arguments: info["params"]);
                  } else {
                    /// 路由跳转页面 无参数
                    Navigator.pushNamed(context, info["url"]);
                  }
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Color.fromRGBO(Random().nextInt(256),
                              Random().nextInt(256), Random().nextInt(256), 1)),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 20),
                      Expanded(
                          child: Text(
                        info["title"],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(width: 20),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                ));
          }),
    );
  }
}
