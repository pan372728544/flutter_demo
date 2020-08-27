// import './pages/provider_page.dart';
import './pages/sliver_page.dart';
import 'package:flutter/material.dart';

final Map routes = {
  // "/provider": (context, {arguments}) => ProviderPage(
  //       arguments: arguments,
  //     ),
  "/sliver": (context) => SliverPage(),
};

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  /// 路由跳转名称（例： "/provider"）
  final String name = settings.name;

  /// 跳转的页面（例： (context) => ProviderPage()）
  final Function pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    /// 有参数
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }

  /// 默认为找到的页面
  return MaterialPageRoute(builder: (context) => NotFoundPage());
}

/// 默认页面
class NotFoundPage extends StatefulWidget {
  NotFoundPage({Key key}) : super(key: key);

  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("页面未找到"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "404",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      )),
    );
  }
}
