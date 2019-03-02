import 'package:flutter/material.dart';
import 'package:metal/pages/home/home.dart';
import 'package:metal/pages/home/Drawer.dart';
import 'package:metal/pages/newprice/newprice.dart';
import 'package:metal/pages/FAB.dart';
import 'package:metal/pages/message/message.dart';
import 'package:metal/pages/my/my.dart';

class Navigatorpage extends StatefulWidget {
  Navigatorpage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NavigatorpageState createState() => _NavigatorpageState();
}

class _NavigatorpageState extends State<Navigatorpage> {
  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  int _selectedIndex = 0;
  PageController _pageController;
  List<Widget> _pages;

  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
    _pages = [
      // ScrollControllerTestRoute(),
      HomePages(global: _globalKey),
      NewPrice(),
      Message(),
      My(),
    ];
  }

  bool appbars_page = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      endDrawer: appbars_page?FilterDrawer(global: _globalKey):null,
      appBar: appbars_page?HomeAppbar():null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: 'Tag1',
        onPressed: onBigImgTap,
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index) {
          setState(() {
            _selectedIndex = index;
            if (index != 0) {
              appbars_page = false;
            }else{
              appbars_page = true;
            }
            print(appbars_page);
            print(index);
          });
        },
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '发布',
        color: Colors.grey,
        selectedColor: Colors.blue,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _onItemTapped,
        selectedIndexs:_selectedIndex,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: '首页'),
          FABBottomAppBarItem(iconData: Icons.call_missed, text: '行情'),
          FABBottomAppBarItem(iconData: Icons.message, text: '消息'),
          FABBottomAppBarItem(iconData: Icons.person, text: '我的'),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(_selectedIndex,
          duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    });
  }

  void onBigImgTap() {
    Navigator.of(context).pushNamed('/go');
  }
}

