import 'package:flutter/material.dart';
import 'package:metal/page/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:metal/page/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder> {
        '/page/search': (_) => new SearchPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: HomePage(title: '首页'),
    );
  }
}
