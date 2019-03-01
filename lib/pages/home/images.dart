import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/search/searchafter.dart';

class Images extends StatefulWidget {
  Images({Key key, this.globals}) : super(key: key);

  final GlobalKey<ScaffoldState> globals;
  
  @override
  _ImagesState createState() {
    return _ImagesState();
  }
}

class _ImagesState extends State<Images> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      // height: 200,
      width: MediaQuery.of(context).size.width,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
            height: 170,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child:Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              runSpacing: 10.0,
              spacing: 5.0,
              children: List<Widget>.generate(
                metals.length, (int index) {
                return Container(
                  width: 66.0,
                  height: 70.0,
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: metals[index].backcolor,
                        radius: 20,
                        child:IconButton(
                          icon: new Image.asset(
                            metals[index].image,
                            fit: BoxFit.fill,
                          ),
                          onPressed: (){
                            Navigator.push( 
                              context,
                              new MaterialPageRoute(builder: (context) {
                                return new SearchAfter(search:metals[index].text);
                              })
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Text(metals[index].text,style:new TextStyle(fontSize: 13.0,),),
                        )
                      ),
                    ],
                  ),
                );
              },).toList(),
            )
          ),
        ],
      ),
    );
  }
}