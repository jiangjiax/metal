import 'package:flutter/material.dart';
import 'package:metal/pages/home/home.dart';
import 'package:metal/pages/home/Drawer.dart';
import 'package:metal/pages/newprice/newprice.dart';
import 'package:metal/pages/FAB.dart';
import 'package:metal/pages/message/message.dart';
import 'package:metal/pages/my/my.dart';
import 'package:metal/pages/add/add.dart';

class Navigatorpage extends StatefulWidget {
  @override
  _NavigatorpageState createState() => _NavigatorpageState();
}

class _NavigatorpageState extends State<Navigatorpage> {
  var _globalKey = new GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  PageController _pageController;
  List<Widget> _pages;

  void initState() {
    super.initState();
    //page
    _pageController = PageController(initialPage: _selectedIndex);
    _pages = [
      HomePages(global:_globalKey),
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
      endDrawer: appbars_page?FilterDrawer():null,
      // endDrawer: FilterDrawer(),
      appBar:appbars_page?AppBar(
        elevation: 0.0,
        titleSpacing:10.0,
        leading: new IconButton(
          icon: new Image.asset(
            "images/logo.gif",
            height: 33,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          Builder(
            builder: (context) =>new IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {Scaffold.of(context).openEndDrawer();},
            ),
          ),
        ],
        title:BarSearch(value:"搜索金属"),
      ):null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: 'Tag1',
        onPressed: onBigImgTap,
        child: Icon(Icons.add),
        elevation: 2.0,
        backgroundColor: Color(0xFF245399),
      ),
      body: PageView.builder(
        physics:NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        // onPageChanged: (int index) {
        //   setState(() {
        //     _selectedIndex = index;
        //     if (index != 0) {
        //       appbars_page = false;
        //     }else{
        //       appbars_page = true;
        //     }
        //   });
        // },
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '发布',
        color: Colors.grey,
        selectedColor: Color(0xFF245399),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _onItemTapped,
        selectedIndexs:_selectedIndex,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: '首页'),
          FABBottomAppBarItem(iconData: Icons.assessment, text: '行情'),
          FABBottomAppBarItem(iconData: Icons.message, text: '消息'),
          FABBottomAppBarItem(iconData: Icons.person, text: '我的'),
        ], 
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index != 0) {
        appbars_page = false;
      }else{
        appbars_page = true;
      }
      _pageController.animateToPage(_selectedIndex,
          duration: Duration(milliseconds: 10), curve: Curves.easeInOut);
    });
  }

  void onBigImgTap() {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) => new Add(iniindex:0)),
    );
  }
  
  Widget HomeAppbar() {
    return new AppBar(
      elevation: 0.0,
      titleSpacing:10.0,
      leading: new IconButton(
        icon: new Image.asset(
          "images/logo.gif",
          height: 35,
        ),
        onPressed: () {Scaffold.of(context).openEndDrawer();},
      ),
      actions: <Widget>[
        new IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ],
      title:BarSearch(value:"搜索金属"),
    );
  }
}

