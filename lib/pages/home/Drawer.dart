import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/data/global_home.dart';

// Map select = new Map();
// Map<String, String> selectTrue = new Map();
// void sadds(index){
//   select["$index"] = "false";
// }
// void saddscon(){
//   List<Widget>.generate(
//     homePageContent["variety"].length, (int index) {
//       sadds(homePageContent["variety"][index]["id"].toString());
//     }
//   );
// }
// void saddSearchTrue(){
//   int num = 0;
  // List<Widget>.generate(
  //   homePageContent["variety"].length, (int index) {
  //     if (select[homePageContent["variety"][index]["id"].toString()]=="true") {
  //       selectTrue["variety"] = homePageContent["variety"][index]["id"].toString();
  //       num++;
  //     }
  //   }
  // );
//   if (num==0) {
//     print(num);
//     selectTrue = {};
//   }
//   print(num);
//   print(selectTrue.toString());
// }

String _controllerPriceLows="";
String _controllerNumberLows="";
String _controllerPriceHighs="";
String _controllerNumberHighs="";
String cityCon="";
int _value = 1;

Map<String,String> drawerCon = new Map();
Map<int,bool> drawerConCate = {0:false,1:false,2:false};

Map<String,String> drawerPrice = new Map();


class FilterDrawer extends StatefulWidget {
  FilterDrawer({Key key, this.global}) : super(key: key);

  final GlobalKey<ScaffoldState> global;
  @override
  _FilterDrawerState createState() {
    return _FilterDrawerState();
  }
}

//筛选
class _FilterDrawerState extends State<FilterDrawer> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = true; //是否显示“返回到顶部”按钮

  void initState() { 
    super.initState();
    List<Widget>.generate(
      Drawers.Cate.length, (int index) {
        Drawers.Cate[index].color = drawerConCate[index];
      }
    );
    _controllerPriceLows =cons["price_low"]==null?"":cons["price_low"];
    _controllerPriceHighs =cons["price_high"]==null?"":cons["price_high"];
    _controllerNumberLows =cons["number_low"]==null?"":cons["number_low"];
    _controllerNumberHighs =cons["number_high"]==null?"":cons["number_high"];
  }

  void conf(){
    if(drawerCon["tid"]=="0"||drawerCon["tid"]=="1"){
      cons["tid"] = drawerCon["tid"].toString();
    }else{
      cons.remove("tid");
    }
    List<Widget>.generate(
      Drawers.Cate.length, (int index) {
        drawerConCate[index] = Drawers.Cate[index].color;
      }
    );
    if (_controllerPriceLows!="") {
      cons["price_low"] = _controllerPriceLows;
    }else{
      cons.remove("price_low");
    }
    if (_controllerPriceHighs!="") {
      cons["price_high"] = _controllerPriceHighs;
    }else{
      cons.remove("price_high");
    }
    if(cons["price_high"]!=null&&cons["price_low"]!=null){
      if (int.parse(cons["price_low"])>int.parse(cons["price_high"])) {
        var zancun = cons["price_low"];
        cons["price_low"] = cons["price_high"];
        cons["price_high"] = zancun;
      }
    }
    if (_controllerNumberLows!="") {
      cons["number_low"] = _controllerNumberLows;
    }else{
      cons.remove("number_low");
    }
    if (_controllerNumberHighs!="") {
      cons["number_high"] = _controllerNumberHighs;
    }else{
      cons.remove("number_high");
    }
    if(cons["number_low"]!=null&&cons["number_high"]!=null){
      if (int.parse(cons["number_low"])>int.parse(cons["number_high"])) {
        var zancun = cons["number_low"];
        cons["number_low"] = cons["number_high"];
        cons["number_high"] = zancun;
      }
    }
    if (cityCon!="") {
      cons["city"] = cityCon;
    }else{
      cons.remove("city");
    }

    print(cons);

    eventBus.fire(cons);
  }
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        scrollDirection: Axis.vertical,
        controller: _controller,
        shrinkWrap: true, 
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height-110,
            child:new ListView(
             scrollDirection: Axis.vertical,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 15.0, 10.0),
                  child: Text("类型",style:TextStyles.TextStyle2(),), 
                ),
                Wrap(
                  children: <Widget>[
                    CateOptions(),
                  ],
                ),
                new Divider(color: Color(0xFFBDBDBD)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                  child: Text("价格",style:TextStyles.TextStyle2(),), 
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: TextEditingController.fromValue(TextEditingValue(
                              text: _controllerPriceLows,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          enabled: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            labelText: '输入最低价',
                            labelStyle: TextStyle(fontSize: 16.0),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (text){
                            _controllerPriceLows = text;
                            print(text);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child:Icon(Icons.import_export,color: Color(0xFF424242)),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: TextEditingController.fromValue(TextEditingValue(
                              text: _controllerPriceHighs,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          enabled: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            labelText: '输入最高价',
                            labelStyle: TextStyle(fontSize: 16.0),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (text){
                            _controllerPriceHighs = text;
                            print(_controllerPriceHighs);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                new Divider(color: Color(0xFFBDBDBD)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                  child: Text("数量",style:TextStyles.TextStyle2(),), 
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: TextEditingController.fromValue(TextEditingValue(
                              text: _controllerNumberLows,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          enabled: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            labelText: '输入最小数量',
                            labelStyle: TextStyle(fontSize: 16.0),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (text){
                            _controllerNumberLows = text;
                            print(_controllerNumberLows);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child:Icon(Icons.import_export,color: Color(0xFF424242)),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: TextEditingController.fromValue(TextEditingValue(
                              text: _controllerNumberHighs,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          enabled: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            labelText: '输入最大数量',
                            labelStyle: TextStyle(fontSize: 16.0),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (text){
                            _controllerNumberHighs = text;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                new Divider(color: Color(0xFFBDBDBD)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                  child: Text("品种",style:TextStyles.TextStyle2(),), 
                ),
                MetalsOptions(),
                new Divider(color: Color(0xFFBDBDBD)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                  child: Text("热门城市",style:TextStyles.TextStyle2(),), 
                ),
                Wrap(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                      child:CityOptions(),
                    ),
                  ],
                ),
              ]
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(55.0, 0.0, 0.0, 0.0),
            child:Row(children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
                color: Color(0xFFE0E0E0),
                onPressed: (){
                  Navigator.pop(context); 
                },
                child: Text('取消',style: new TextStyle(fontSize: 15.0,color: Colors.black),),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
                color: Color(0xFF64B5F6),
                onPressed: (){
                  setState(() {
                    conf();
                  });
                  Navigator.pop(context); 
                },
                child: Text('确定',style: new TextStyle(fontSize: 15.0,color: Colors.black),),
              ),
            ],)
          ),
        ],
      )
    );
  }
}

// 城市
class CityOptions extends StatefulWidget {
  @override
  _CityOptionsState createState() => _CityOptionsState();
}
class _CityOptionsState extends State<CityOptions> {
  // int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: -10.0,
      children: List<Widget>.generate(
      homePageContent["hotCity"].length, (int index) {
      return ChoiceChip(
      //  shape: new BeveledRectangleBorder(
      //    borderRadius: BorderRadius.circular(2.0),
      //  ),
      backgroundColor: Color(0xFFEEEEEE),
        label: new Text(
          homePageContent["hotCity"][index]["name"],
          overflow: TextOverflow.ellipsis,
        ),
        selected: _value == index,
        onSelected: (bool selected) {
          setState(() {
            _value = selected ? index : null;
          });
          if(selected==true){
            cityCon = homePageContent["hotCity"][index]["id"];
          }else{
            cityCon = "";
          }
          print(cityCon);
        },
      );
    },).toList(),
    );
  }
}

//类型
class CateOptions extends StatefulWidget {
  @override
  _CateOptionsState createState() => _CateOptionsState();
}
class _CateOptionsState extends State<CateOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child:Wrap(
        spacing: 6.0,
        runSpacing: 6.0,
        children: List<Widget>.generate(
          Drawers.Cate.length, (int index) {
            return Ink(
              width: 90.0,
              height: 40.0,
              child:InkWell(
                onTap: () {
                  setState(() {
                    if (Drawers.Cate[index].color == true) {
                      Drawers.Cate[index].color = false;
                      drawerCon = {};
                    } else{
                      Drawers.Cate[0].color = false;
                      Drawers.Cate[1].color = false;
                      Drawers.Cate[2].color = false;
                      Drawers.Cate[index].color = true;
                      drawerCon["tid"] = (index-1).toString();
                      print(index);
                    }
                  });
                  print(drawerCon);
                },
                child: Container( 
                  alignment: Alignment.center,
                  child:new Text(
                    Drawers.Cate[index].text,
                    overflow: TextOverflow.ellipsis,
                    style:new TextStyle(
                      fontSize: 15.0,
                      color: Drawers.Cate[index].color==true?Colors.blue:Colors.black,
                    )
                  ),
                  decoration: BoxDecoration(
                    color:Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(5.0),
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

//品种
class MetalsOptions extends StatefulWidget {
  @override
  _MetalsOptionsState createState() => _MetalsOptionsState();
}
class _MetalsOptionsState extends State<MetalsOptions> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child:Wrap(
          alignment: WrapAlignment.start,
          spacing: 6.0,
          runSpacing: 6.0,
          children: List<Widget>.generate(
            homePageContent["variety"].length, (int index) {
              return Ink(
                width: 90.0,
                height: 40.0,
                child:InkWell(
                  onTap: () {
                    setState(() {
                      // if (select[homePageContent["variety"][index]["id"]] == "true") {
                      //   select[homePageContent["variety"][index]["id"]] = "false";
                      // }else{
                      //   select[homePageContent["variety"][index]["id"]] = "true";
                      // }
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child:new Text(
                      homePageContent["variety"][index]["name"],
                      overflow: TextOverflow.ellipsis,
                      style:new TextStyle(
                        fontSize: 15.0,
                        // color: select[homePageContent["variety"][index]["id"]]=="false"?Colors.black:Colors.blue,
                        color: Colors.black,
                      )
                    ),
                    decoration: BoxDecoration(
                      color:Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                )
              );
            },
          ).toList(),
        )
    );
  }
}