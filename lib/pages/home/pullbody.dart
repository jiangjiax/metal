import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/Details/Details.dart';

class Pullbody extends StatefulWidget {
  @override
  _PullbodyState createState() {
    return _PullbodyState();
  }
}
class _PullbodyState extends State<Pullbody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true, 
        itemCount: 5,
        itemBuilder: (context, index) {
          return new Card(
            child:Ink(
              child:InkWell(
                onTap: (){
                  print(index);
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new Details()),
                  );
                },
                child:Pullbody_Card()
              ),
            ),
          );
        }
      )
    );
  }
}

class Pullbody_Card extends StatefulWidget {
  @override
  _Pullbody_CardState createState() {
    return _Pullbody_CardState();
  }
}
class _Pullbody_CardState extends State<Pullbody_Card> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 105.0,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              height: 110.0,
              child: new Image.asset(
                GlobalSwiper.images[1],
                fit:BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 0.0),
              alignment: Alignment.center,
              child: Stack(
                children: <Widget>[
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('眼镜厂废料',style: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                          Spacer(
                            flex: 1,
                          ),
                          Text("¥300元/吨",style: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.red),),
                        ],
                      ),
                      Text('参考价格: 305元/吨',style: new TextStyle(fontSize: 16.0),),
                      Text('共需:1000吨 | 还需:500吨',style: new TextStyle(fontSize: 16.0),),
                      Text('发布时间: 2019-01-01 19:00:00',style: TextStyles.TextStyle2(),),
                    ],
                  ),
                ]
              ),
            )
          )
        ]
      ),
    );
  }
}