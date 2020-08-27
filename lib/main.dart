import 'package:flutter/material.dart';
import './tabpags/home_page.dart';
import './tabpags/category_page.dart';
import './tabpags/setting_page.dart';
import 'router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  /// 底部导航列表
  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(Icons.category), title: Text("分类")),
    BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("设置")),
  ];

  ///  当前选中的Tab
  int _currentTabIndex = 0;

  /// 底部导航页面
  final List _pages = [HomePage(), CategoryPage(), SettingPage()];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget._pages[widget._currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget._currentTabIndex,
        items: widget._items,
        onTap: (index) {
          /// 设置点击的索引值
          setState(() {
            widget._currentTabIndex = index;
          });
        },
      ),
    );
  }
}
