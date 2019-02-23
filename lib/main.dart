  import 'package:flutter/material.dart';
  import 'package:metal/widgets/index.dart';
  import 'package:metal/pages/search.dart';

  void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder> {
          '/pages/search': (_) => new SearchPage(),
        },
        title: 'Flutter Demo',
        home: Navigatorpage(title: '首页'),
      );
    }
  }
