import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/page/search.dart';
import 'package:metal/widgets/swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static GlobalKey<ScaffoldState> _globalKey= new GlobalKey();
  String bigImg = 'images/big.png';
  final _SearchDemoSearchDelegate _delegate = _SearchDemoSearchDelegate();

  int _selectedIndex = 0;
  PageController _pageController;
  List<Widget> _pages;
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
    _pages = [
      HomePages(global: _globalKey),
      Container(color: Colors.blue),
      Container(color: Colors.brown),
      Container(color: Colors.amber),
      Container(color: Colors.grey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey ,
      endDrawer: MyDrawer(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.purple,
              ],
            ),
          ),
        ),
        titleSpacing:0,
        leading: new IconButton(
          icon: new Icon(
            Icons.android,
            color: Colors.white,
          ),
          onPressed: () {
            _globalKey.currentState.openEndDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_play,color: Colors.white,),
            onPressed: null,
          ),
        ],
        title: barSearch(),
      ),
      body:(
        Stack(
          children: <Widget>[
            Scaffold(
              body:PageView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return _pages[index];
                },
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (int index) {
                  setState(() {
                    _selectedIndex = index;
                    if(index!=2 && bigImg == 'images/bigafter.png'){
                      bigImg = 'images/big.png';
                    }
                    if(index==2){
                      bigImg = 'images/bigafter.png';
                    }
                  });
                },
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
                  BottomNavigationBarItem(icon: Icon(Icons.call_missed), title: Text('行情')),
                  BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('发布')),
                  BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('消息')),
                  BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
                ],
                onTap: _onItemTapped,
                currentIndex: _selectedIndex,
                type: BottomNavigationBarType.fixed,
              ),
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: FloatingActionButton(
                  backgroundColor:Colors.white,
                  child: new Image.asset(bigImg),
                  onPressed: onBigImgTap,
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ],
        )
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      if(index!=2 && bigImg == 'images/bigafter.png'){
        bigImg = 'images/big.png';
      }
      if(index==2){
        bigImg = 'images/bigafter.png';
      }

      _selectedIndex = index;
      _pageController.animateToPage(_selectedIndex,
          duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    });
  }
  void onBigImgTap() {
    setState(() {
      bigImg = 'images/bigafter.png';
      _onItemTapped(2);
    });
  }

  Widget barSearch() {
    return new Container(
      child: new FlatButton(
          child: new Row(
            children: <Widget>[
              new Container(
                child: new FlatButton.icon(
                  onPressed: () {
                    //            Navigator.of(context).pushNamed('/page/search');
                    showSearch<int>(
                      context: context,
                      delegate: _delegate,
                    );
                  },
                  icon: new Icon(
                      Icons.search,
                      color: GlobalConfig.fontColor1,
                      size: 25.0
                  ),
                  label: new Text(
                    "搜索金属",
                    style: new TextStyle(color: GlobalConfig.fontColor1,fontSize: 18.0),
                  ),
                )
              ),
            ],
          ),
          onPressed: () {
//            Navigator.of(context).pushNamed('/page/search');
            showSearch<int>(
              context: context,
              delegate: _delegate,
            );
          }
      ),
      decoration: new BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
        color: GlobalConfig.searchBackgroundColor,
      ),
    );
  }
}

class _SearchDemoSearchDelegate extends SearchDelegate<int> {
  final List<String> _data = GlobalSearch().data;
  final List<String> _history = GlobalSearch().history;

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      primaryColorBrightness: Brightness.dark,
      primaryTextTheme: theme.textTheme,
    );
  }

  @override
  //返回
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  //推荐
  Widget buildSuggestions(BuildContext context) {

    //集合
    final Iterable<String> suggestions = query.isEmpty
        ? _history
        : _data.where((String i) => '$i'.startsWith(query));

    //执行_SuggestionList类 历史记录
    return _SuggestionList(
      query: query,
      suggestions: suggestions.map<String>((String i) => '$i').toList(),
      onSelected: (String suggestion) {
        query = suggestion;
        showResults(context);
      },
    );
  }

  @override
  //回值
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        '"$query"\n',
        textAlign: TextAlign.center,
        style: new TextStyle(color: GlobalConfig.fontColor,fontSize: 30.0),
      ),
    );
  }

  @override
  //删除
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }
}

class _SuggestionList extends StatelessWidget {
  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? const Icon(Icons.history) : const Icon(null),
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: theme.textTheme.subhead.copyWith(
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: theme.textTheme.subhead,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}

class HomePages extends StatefulWidget {
  HomePages({Key key, this.global}) : super(key: key);

  final GlobalKey<ScaffoldState> global;

  @override
  _HomePagesState createState() {
    return _HomePagesState();
  }
}

class _HomePagesState extends State<HomePages> {
  Color _textColorEntire = GlobalButton.textColorBefore;
  Color _textColoNew = GlobalButton.textColorBefore;
  Color _textColorNumber = GlobalButton.textColorBefore;
  Color _textColorSelect = GlobalButton.textColorBefore;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Color(0xFFEEEEEE),
      child:Wrap(
        children: <Widget>[
          Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Container(child: SwiperPages(),height: 200.0,),
            ],
          ),
          Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                decoration: BoxDecoration(
                  border: new Border(top: new BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid,),)
                ),
              ),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: new Container(
                  height: 40.0,
                  child: new FlatButton(
                  child: Text("综合",style: new TextStyle(fontSize: 16.0)),
                  onPressed: () {
                    onFlatButton(1);
                    print('综合');
                  },
                  textTheme: ButtonTextTheme.accent,
                  textColor: _textColorEntire,
                  disabledTextColor: Colors.blue,
                  highlightColor: Colors.blue,
                  // 按下的背景色
                  splashColor: Colors.blue,
                  color: Colors.white,
                  shape: BorderDirectional(
                    end: new BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid,),
                    top: new BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid,),
                    bottom: new BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid,),
                  ),
                  // 水波纹颜色
                ),
                ),
              ),
              Expanded(
                flex: 1,
                child: new Container(
                  height: 40.0,
                  child: new FlatButton(
                    child: Text("最新",style: new TextStyle(fontSize: 16.0)),
                    onPressed: () {
                      onFlatButton(2);
                      print('最新');
                    },
                    textTheme: ButtonTextTheme.accent,
                    textColor: _textColoNew,
                    disabledTextColor: Colors.blue,
                    highlightColor: Colors.blue,
                    // 按下的背景色
                    splashColor: Colors.blue,
                    color: Colors.white,
                    shape: BorderDirectional(
                      end: new BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid,),
                      top: new BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid,),
                      bottom: new BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid,),
                    ),
                    // 水波纹颜色
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: new Container(
                  height: 40.0,
                  child: new FlatButton(
                    child: Text("数量",style: new TextStyle(fontSize: 16.0)),
                    onPressed: () {
                      onFlatButton(3);
                      print('数量');
                    },
                    textTheme: ButtonTextTheme.accent,
                    textColor: _textColorNumber,
                    disabledTextColor: Colors.blue,
                    highlightColor: Colors.blue,
                    // 按下的背景色
                    splashColor: Colors.blue,
                    color: Colors.white,
                    shape: BorderDirectional(
                      end: new BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid,),
                      top: new BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid,),
                      bottom: new BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid,),
                    ),
                    // 水波纹颜色
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: new Container(
                  height: 40.0,
                  child: new FlatButton(
                    child:Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          child: Text("筛选",style: new TextStyle(fontSize: 16.0)),
                        ),
                        Expanded(
                          child: Icon(Icons.select_all,color: _textColorSelect,),
                        ),
                      ]
                    ),
                    onPressed: () {
                      onFlatButton(4);
                      print('筛选');
                      widget.global.currentState.openEndDrawer();
                    },
                    textTheme: ButtonTextTheme.accent,
                    textColor: _textColorSelect,
                    disabledTextColor: Colors.blue,
                    highlightColor: Colors.blue,
                    // 按下的背景色
                    splashColor: Colors.blue,
                    color: Colors.white,
                    shape: BorderDirectional(
                      top: new BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid,),
                      bottom: new BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid,),
                    ),
                    // 水波纹颜色
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void onFlatButton(int index) {
    setState(() {
      print(index);
      if(index==1){
        onFlatButtonHelp();
        _textColorEntire = GlobalButton.textColorAfter;
      }
      if(index==2){
        onFlatButtonHelp();
        _textColoNew = GlobalButton.textColorAfter;
      }
      if(index==3){
        onFlatButtonHelp();
        _textColorNumber = GlobalButton.textColorAfter;
      }
      if(index==4){
        onFlatButtonHelp();
        _textColorSelect = GlobalButton.textColorAfter;
      }
    });
  }
  void onFlatButtonHelp() {
    setState(() {
      _textColorEntire = GlobalButton.textColorBefore;
      _textColoNew = GlobalButton.textColorBefore;
      _textColorNumber = GlobalButton.textColorBefore;
      _textColorSelect = GlobalButton.textColorBefore;
    });
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[

        ],
      ),
    );
  }
}

