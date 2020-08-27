
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// /// 复制providerdemo
// class ProviderPage extends StatelessWidget {
//   const ProviderPage({Key key,this.arguments}) : super(key: key);
//   final Map<String,String> arguments;
//   @override
//   Widget build(BuildContext contexRt) {
//     return MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (_) => Counter()),
//         ],
//         child: Builder(builder: (BuildContext context) {
//           return Scaffold(
//             appBar: AppBar(title: Text("provider-${arguments['id']}"),),
//             body: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text('You have pushed the button this many times:'),

//                 /// Extracted as a separate widget for performance optimization.
//                 /// As a separate widget, it will rebuild independently from [MyHomePage].
//                 ///
//                 /// This is totally optional (and rarely needed).
//                 /// Similarly, we could also use [Consumer] or [Selector].
//                 const Count(),
//               ],
//             ),
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: ()=> context.read<Counter>().increment(),
//             tooltip: 'Increment',
//             child: Icon(Icons.add),
//           ),

//           );
//         }));
//   }
// }

// class Count extends StatelessWidget {
//   const Count({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//         /// Calls `context.watch` to make [MyHomePage] rebuild when [Counter] changes.
//         '${context.watch<Counter>().count}',
//         style: Theme.of(context).textTheme.headline4);
//   }
// }


// /// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// class Counter with ChangeNotifier, DiagnosticableTreeMixin {
//   int _count = 0;
//   int get count => _count;

//   void increment() {
//     _count++;
//     notifyListeners();
//   }

//   /// Makes `Counter` readable inside the devtools by listing all of its properties
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(IntProperty('count', count));
//   }
// }

