import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';

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
                new Divider(color: Color(0xFF757575)),
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
                          keyboardType: TextInputType.number,
                          enabled: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            labelText: '输入最低价',
                            labelStyle: TextStyle(fontSize: 16.0),
                            border: OutlineInputBorder(),
                          ),
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
                          keyboardType: TextInputType.number,
                          enabled: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            labelText: '输入最高价',
                            labelStyle: TextStyle(fontSize: 16.0),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Divider(color: Color(0xFF757575)),
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
                          keyboardType: TextInputType.number,
                          enabled: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            labelText: '输入最小数量',
                            labelStyle: TextStyle(fontSize: 16.0),
                            border: OutlineInputBorder(),
                          ),
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
                          keyboardType: TextInputType.number,
                          enabled: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            labelText: '输入最大数量',
                            labelStyle: TextStyle(fontSize: 16.0),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Divider(color: Color(0xFF757575)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                  child: Text("品种",style:TextStyles.TextStyle2(),), 
                ),
                MetalsOptions(),
                new Divider(color: Color(0xFF757575)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                  child: Text("城市",style:TextStyles.TextStyle2(),), 
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
                  print('取消');
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
                  print('确定');
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
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: -10.0,
      children: List<Widget>.generate(
      Drawers.City.length, (int index) {
      return ChoiceChip(
      //  shape: new BeveledRectangleBorder(
      //    borderRadius: BorderRadius.circular(2.0),
      //  ),
      backgroundColor: Color(0xFFEEEEEE),
        label: new Text(
          Drawers.City[index],
          overflow: TextOverflow.ellipsis,
        ),
        selected: _value == index,
        onSelected: (bool selected) {
          setState(() {
            _value = selected ? index : null;
          });
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
              color:Color(0xFFEEEEEE),
              child:InkWell(
                onTap: () {
                  setState(() {
                    if (Drawers.Cate[index].color == true) {
                      Drawers.Cate[index].color = false;
                    } else{
                      Drawers.Cate[0].color = false;
                      Drawers.Cate[1].color = false;
                      Drawers.Cate[2].color = false;
                      Drawers.Cate[index].color = true;
                    }
                  });
                  print(Drawers.Cate[index].color);
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
                ),
              )
            );
          },
        ).toList(),
      )
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
          spacing: 6.0,
          runSpacing: 6.0,
          children: List<Widget>.generate(
            Drawers.alignmentValues.length, (int index) {
              return Ink(
                width: 90.0,
                height: 40.0,
                color:Color(0xFFEEEEEE),
                child:InkWell(
                  onTap: () {
                    setState(() {
                      if (Drawers.alignmentValues[index].color == true) {
                        Drawers.alignmentValues[index].color = false;
                      } else{
                        if (index==0) {
                          List<Widget>.generate(
                            Drawers.alignmentValues.length, (int index) {
                              Drawers.alignmentValues[index].color = false;
                            }
                          ).toList();
                          Drawers.alignmentValues[index].color = true;
                        }else{
                          Drawers.alignmentValues[index].color = true;
                          Drawers.alignmentValues[0].color = false;
                        }
                      }
                    });
                    print(Drawers.alignmentValues[index].color);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child:new Text(
                      Drawers.alignmentValues[index].text,
                      overflow: TextOverflow.ellipsis,
                      style:new TextStyle(
                        fontSize: 15.0,
                        color: Drawers.alignmentValues[index].color==true?Colors.blue:Colors.black,
                      )
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