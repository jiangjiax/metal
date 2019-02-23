import 'package:flutter/material.dart';
import 'package:metal/pages/home/home.dart';
import 'package:metal/pages/home/Drawer.dart';
import 'package:metal/pages/Details/Details.dart';
import 'package:metal/pages/cs.dart';

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
      Container(color: Colors.brown),
      Container(color: Colors.amber),
      Container(color: Colors.grey),
    ];
  }

  bool appbars_page = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      endDrawer: FilterDrawer(global: _globalKey),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.call_missed), title: Text('行情')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), title: Text('发布')),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), title: Text('消息')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('我的')),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
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
    setState(() {
      _onItemTapped(2);
    });
  }
}

