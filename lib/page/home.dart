import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/page/search.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _SearchDemoSearchDelegate _delegate = _SearchDemoSearchDelegate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: barSearch(),
          backgroundColor: Colors.white,
        ),
//        body:barSearch(),
    );
  }

  Widget barSearch() {
    return new Container(
      child: new FlatButton(
          child: new Row(
            children: <Widget>[
              new Container(
                  child: new FlatButton.icon(
                    icon: new Icon(
                        Icons.search,
                        color: GlobalConfig.fontColor,
                        size: 25.0
                    ),
                    label: new Text(
                      "搜索金属",
                      style: new TextStyle(color: GlobalConfig.fontColor,fontSize: 18.0),
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
        borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
        color: GlobalConfig.searchBackgroundColor,
      ),
    );
  }
}

class _SearchDemoSearchDelegate extends SearchDelegate<int> {
  final List<String> _data = Search().data;
  final List<String> _history = Search().history;

  @override
  //返回
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Navigator.pop(context,null);
      },
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
              style: theme.textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
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

