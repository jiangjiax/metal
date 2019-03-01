import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/my/golist.dart';

class Wallet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WalletState();
  }
}

class WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF64B5F6),
                Color(0xFF1976D2),
              ],
            ),
          ),
        ),   
        elevation: 0.0,
      ),
      body:ListView(
        children: <Widget>[
          WalletHeader(),
          new Divider(height: 0,),
          WalletBody(),
          new Divider(height: 0,),
        ]
      )
    );
  }
}

class WalletHeader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WalletHeaderState();
  }
}

class WalletHeaderState extends State<WalletHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:Alignment.center, 
      children: <Widget>[
        Container(
          height: 130,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF64B5F6),
                Color(0xFF1976D2),
              ],
            ),
          ), 
        ),
        Positioned(
          top:0,
          child: Ink(
            child: InkWell(
            child:Container(
              child: Column(
                children: <Widget>[
                  new CircleAvatar(
                    backgroundImage: new AssetImage("images/rmb.jpg"),
                    radius: 35,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text('余额',style: TextStyle(fontSize: 16.0,color: Colors.white,)),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text('¥200.0',style: TextStyle(fontSize: 17.0,color: Colors.white),),
                  )
                ],
              ),
            )
            )
          ),
        ),
      ],
    );
  }
}

class WalletBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WalletBodyState();
  }
}

class WalletBodyState extends State<WalletBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: <Widget>[
          Material( 
            color: Colors.white,
            child: Ink(
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new ListGo()),
                  );
                },
                child: Container(
                  height: 60,
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child:Row(children: <Widget>[
                          Icon(Icons.credit_card,size: 30,color: Colors.blue,),
                          Text(" 充值",style:TextStyle(fontSize: 16.0))
                        ],)
                      ),
                      Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.blue,),
                    ],
                  ),
                ),
              ),
            ),
          ),
          new Divider(height: 0,),
          Material( 
            color: Colors.white,
            child: Ink(
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new WalletBodyList()),
                  );
                },
                child: Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child:Row(children: <Widget>[
                          Icon(Icons.featured_play_list,size: 30,color: Colors.blue,),
                          Text(" 账单",style:TextStyle(fontSize: 16.0))
                        ],)
                      ),
                      Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.blue,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WalletBodyList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _WalletBodyListState();
  }
}

class _WalletBodyListState extends State<WalletBodyList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: Text("账单"),
      ),
      body:ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("2019年02月账单",style: new TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),
                      Text("支出¥100 收入¥100",style: TextStyles.TextStyle3(),),
                    ],
                  ),
                ),
                new Divider(height: 0,),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("充值",style: new TextStyle(fontSize: 17.0),),
                          Text("02月1日 13:00:00",style: TextStyles.TextStyle3(),),
                        ],
                      ),
                      Text("+100",style: new TextStyle(fontSize: 20.0,color: Colors.green),),
                    ],
                  )
                ),
                new Divider(height: 0,),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("检验付费",style: new TextStyle(fontSize: 17.0),),
                          Text("02月1日 13:00:00",style: TextStyles.TextStyle3(),),
                        ],
                      ),
                      Text("-100",style: new TextStyle(fontSize: 20.0,color: Colors.red),),
                    ],
                  )
                ),
              ],
            ),
          ),
          new Divider(height: 0,)
        ]
      )
    );
  }
}