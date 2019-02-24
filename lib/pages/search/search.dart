import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget{
  @override
  SearchPageState createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {

  Widget searchInput() {
    return new Container(
        child: new TextField(
          autofocus: true,
          style: new TextStyle(color: Colors.blue),
          decoration: new InputDecoration.collapsed(
            hintText: "搜索比乎内容",
            hintStyle: new TextStyle(color: Colors.blue),
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(
          primaryColor: Colors.white,
        ),
        home: new Scaffold(
          appBar: new AppBar(
            leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back,
              ),
              onPressed: () {Navigator.of(context).pop();},
            ),
            title: searchInput(),
          ),
          body: new SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new Text("比乎热搜", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                  margin: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 16.0),
                  alignment: Alignment.topLeft,
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                      child: new Chip(
                        label: new FlatButton(onPressed: (){}, child: new Text("汽车关税下调",)),
                        // backgroundColor: GlobalConfig.dark == true ? Colors.white10 : Colors.black12,
                      ),
                      margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                      alignment: Alignment.topLeft,
                    ),
                    new Container(
                      child: new Chip(
                        label: new FlatButton(onPressed: (){}, child: new Text("李彦宏传闻辟谣")),
                        // backgroundColor: GlobalConfig.dark == true ? Colors.white10 : Colors.black12,
                      ),
                      margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                      child: new Chip(
                        label: new FlatButton(onPressed: (){}, child: new Text("小米8")),
                        // backgroundColor: GlobalConfig.dark == true ? Colors.white10 : Colors.black12,
                      ),
                      margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                      alignment: Alignment.topLeft,
                    ),
                    new Container(
                      child: new Chip(
                        label: new FlatButton(onPressed: (){}, child: new Text("超时空同居")),
                        // backgroundColor: GlobalConfig.dark == true ? Colors.white10 : Colors.black12,
                      ),
                      margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
                new Container(
                  child: new Text("搜索历史", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                  margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                  alignment: Alignment.topLeft,
                ),
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        // child: new Icon(Icons.access_time, color: GlobalConfig.fontColor, size: 16.0),
                        margin: const EdgeInsets.only(right: 12.0),
                      ),
                      new Expanded(
                        child: new Container(
                          // child: new Text("业余兴趣", style: new TextStyle( color: GlobalConfig.fontColor, fontSize: 14.0),),
                        ),
                      ),
                      new Container(
                        // child: new Icon(Icons.clear, color: GlobalConfig.fontColor, size: 16.0),
                      )
                    ],
                  ),
                  margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
                  padding: const EdgeInsets.only(bottom: 10.0),
                  decoration: new BoxDecoration(
                    // border: new BorderDirectional(bottom: new BorderSide(color: GlobalConfig.dark == true ?  Colors.white12 : Colors.black12))
                  ),
                ),
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        // child: new Icon(Icons.access_time, color: GlobalConfig.fontColor, size: 16.0),
                        margin: const EdgeInsets.only(right: 12.0),
                      ),
                      new Expanded(
                        child: new Container(
                          // child: new Text("三体", style: new TextStyle( color: GlobalConfig.fontColor, fontSize: 14.0),),
                        ),
                      ),
                      new Container(
                        // child: new Icon(Icons.clear, color: GlobalConfig.fontColor, size: 16.0),
                      )
                    ],
                  ),
                  margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
                  padding: const EdgeInsets.only(bottom: 10.0),
                  decoration: new BoxDecoration(
                      // border: new BorderDirectional(bottom: new BorderSide(color: GlobalConfig.dark == true ?  Colors.white12 : Colors.black12))
                  ),
                ),
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        // child: new Icon(Icons.access_time, color: GlobalConfig.fontColor, size: 16.0),
                        margin: const EdgeInsets.only(right: 12.0),
                      ),
                      new Expanded(
                        child: new Container(
                          // child: new Text("人类未来", style: new TextStyle( color: GlobalConfig.fontColor, fontSize: 14.0),),
                        ),
                      ),
                      new Container(
                        // child: new Icon(Icons.clear, color: GlobalConfig.fontColor, size: 16.0),
                      )
                    ],
                  ),
                  margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
                  padding: const EdgeInsets.only(bottom: 10.0),
                  decoration: new BoxDecoration(
                      // border: new BorderDirectional(bottom: new BorderSide(color: GlobalConfig.dark == true ?  Colors.white12 : Colors.black12))
                  ),
                ),
              ],
            ),
          )
        )
    );
  }
}