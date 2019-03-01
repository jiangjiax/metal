import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/search/searchafter.dart';

class SearchBefore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Text("热门搜索", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
            alignment: Alignment.topLeft,
          ),
          new Container(
            child: HotSeachers(),
          ),
          new Container(
            child: new Text("搜索历史", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
            alignment: Alignment.topLeft,
          ),
          new Container(
            child: HistorySeachers(),
          ),
        ],
      ),
    );
  }
}

class HotSeachers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child:Wrap(
        alignment: WrapAlignment.start,
        spacing: 6.0,
        runSpacing: 6.0,
        children: List<Widget>.generate(
          GlobalSearch.hot.length, (int index) {
            return Ink(
              width: 85.0,
              height: 40.0,
              child:InkWell(
                onTap: () {
                  Navigator.push( 
                    context,
                    new MaterialPageRoute(builder: (context) {
                      return new SearchAfter(search:GlobalSearch.hot[index]);
                    })
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child:new Text(
                    GlobalSearch.hot[index],
                    overflow: TextOverflow.ellipsis,
                    style:new TextStyle(
                      fontSize: 15.0,
                    )
                  ),
                  decoration: BoxDecoration(
                    color:Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              )
            );
          },
        ).toList(),
      ),
    );
  }
}

class HistorySeachers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child:Wrap(
        alignment: WrapAlignment.start,
        spacing: 6.0,
        runSpacing: 6.0,
        children: List<Widget>.generate(
          GlobalSearch.history.length, (int index) {
            return Ink(
              width: 85.0,
              height: 40.0,
              child:InkWell(
                onTap: () {
                  Navigator.push( 
                    context,
                    new MaterialPageRoute(builder: (context) {
                      return new SearchAfter(search:GlobalSearch.history[index]);
                    })
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child:new Text(
                    GlobalSearch.history[index],
                    overflow: TextOverflow.ellipsis,
                    style:new TextStyle(
                      fontSize: 15.0,
                    )
                  ),
                  decoration: BoxDecoration(
                    color:Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              )
            );
          },
        ).toList(),
      ),
    );
  }
}