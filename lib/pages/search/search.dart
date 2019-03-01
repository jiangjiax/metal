import 'package:flutter/material.dart';
import 'package:metal/pages/search/searchbefore.dart';
import 'package:metal/pages/search/searchAfter.dart';

class SearchPage extends StatefulWidget{
  @override
  SearchPageState createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  static final closeyes = new Icon((Icons.close),color: Colors.black,);

  Widget searchInput() {
    return new Container(
      margin: const EdgeInsets.fromLTRB(0, 2.0, 0, 0),
      child: new TextField(
        maxLength: 8,
        controller:controller,
        autofocus: true,
        style: new TextStyle(color: Colors.black,fontSize: 18.0),
        decoration: new InputDecoration(
          hintText: "请输入金属品种……",
          hintStyle: new TextStyle(color: Colors.grey,fontSize: 18.0),
          border: InputBorder.none,
        ),
        onSubmitted: (String text){
          Navigator.push( 
            context,
            new MaterialPageRoute(builder: (context) {
              return new SearchAfter(search:text);
            })
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {Navigator.of(context).pop();},
        ),
        actions: <Widget>[
          new IconButton(
            icon: closeyes,
            onPressed: onclose,
          )
        ],
        title: searchInput(),
      ),
      body: new SearchBefore()
    );
  }
  void onclose() {
    setState(() {
      controller.text=""; 
    });
  }

}