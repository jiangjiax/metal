  import 'package:flutter/material.dart';
  import 'package:metal/index.dart';
  import 'package:metal/pages/search/search.dart';

  import 'package:metal/pages/my/login.dart';
  import 'package:flutter_localizations/flutter_localizations.dart';

  void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        localizationsDelegates: [
          // 本地化的代理类
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // 美国英语
          const Locale('zh', 'CH'), // 中文简体
          //其它Locales
        ],
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder> {
          '/search': (_) => new SearchPage(),
          '/logingo': (_) => new LoginPage(),
          '/logins': (_) => new LoginsPage(),
          '/loginyzm': (_) => new LoginyzmPage(),
          '/loginpassword': (_) => new Passwordlogin(),
          '/index': (_) => new Navigatorpage(),
        },
        title: 'Flutter Demo',
        home: Navigatorpage(),
      );
    }
  }