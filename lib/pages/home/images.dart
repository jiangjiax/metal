import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';

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
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child:Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              runSpacing: 10.0,
              spacing: 10.0,
              children: List<Widget>.generate(
                metals.length, (int index) {
                return Container(
                  width: 70.0,
                  height: 80.0,
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: CircleAvatar(child: Text('图片'),radius: 30.0,),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(metals[index],style:new TextStyle(fontSize: 14.0,),),
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