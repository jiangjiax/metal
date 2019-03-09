import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:metal/data/global_home.dart';
import 'package:metal/pages/add/area.dart';
import 'package:metal/index.dart';

//value
String titleValue = "";
String numberValue = "";
String unitValue = "2";
String phoneValue = "";
String localValue = "";
String dataValue = "15";
String selectValue = "";
String moreValue = "";
String cateValue = "";
String priceValue = "";
String nameValue = "";
String oreValue = "";
List<File> imageing = [];
int imageingl = 0;
List<File> imageingx = [];
int imageinglx = 0;
List<String> imgs = [];
List<String> content_img = [];
String initid = "0";

class Add extends StatefulWidget {
  final int iniindex;
  Add({Key key, this.iniindex}) : super(key: key);

  @override
  _AddState createState() {
    return _AddState();
  }
}
class _AddState extends State<Add> {
  @override
  void initState() { 
    super.initState();
    localValue = localhigh;
    eventBus.on().listen((event) {
      lyb();
    });
  }
  void lyb(){
    if(mounted) {
      setState(() {
        // print("lyb");
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      initialIndex: this.widget.iniindex,
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.clear),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
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
          title: Text('发布需求'),
          bottom: new TabBar(
            tabs: [
              new Tab(text: "发布供应资源"),
              new Tab(text: "发布采购资源"),
            ],
          ),
        ),
        body: new TabBarView(
          children: [
            new FutureBuilder(
              future: getreleasePageContent(urls_release,{"uid":"1"}),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  initid = "0";
                  return AddBody(iniindex:0);
                } else if (snapshot.hasError) {
                  return new Text("${snapshot.error}");
                }

                // By default, show a loading spinner
                return new Center(
                  child:CircularProgressIndicator()
                );
              }
            ),
            new FutureBuilder(
              future: getreleasePageContent(urls_release,{"uid":"1"}),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  initid = "1";
                  return AddBody(iniindex:1);
                } else if (snapshot.hasError) {
                  return new Text("${snapshot.error}");
                }

                // By default, show a loading spinner
                return new Center(
                  child:CircularProgressIndicator()
                );
              }
            ),
          ]
        ),
        bottomNavigationBar: Container(
          color: Colors.blue,
          height: 50,
          child:Material(
            color: Colors.blue,
            child: Ink(
              child:InkWell(
                onTap: (){
                  // localValue==""||
                  bool valuebool = titleValue==""||numberValue==""||unitValue==""||phoneValue==""||
                    localid==""||dataValue==""||moreValue==""||localhigh=="";
                  bool catebool = cateValue=="";
                  if(catebool==true){
                    gosub('请选择品种');
                  }else{
                    if (valuebool==true) {
                      gosub('请填写供应资源需求表格，不能为空');
                    }else{
                      showDialog<Null>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                        return new AlertDialog(
                          title: new Text("发布成功", style: new TextStyle(fontSize: 17.0)),
                          actions: <Widget>[
                          new FlatButton(
                            child: new Text('确定'),
                            onPressed: (){
                              print("确定");
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                new MaterialPageRoute(builder: (context) => new Navigatorpage()),
                              );
                            },
                          ),
                          ],
                        );
                        }
                      );
                      Map<String,String> go = {"variety":cateValue,"title":titleValue,"number":numberValue.toString(),"tid":initid.toString(),
                      "unit":unitValue,"mobile":phoneValue.toString(),"content_word":moreValue,"price":priceValue,"name":nameValue,"ore":oreValue};
                      if(local!=""){
                        go["province"] = localid;
                      }
                      if(initid == "1"){
                        go["validity"] = dataValue;
                      }
                      if(localcity!=""){
                        go["city"] = localcityid;
                      }
                      if(localarea!=""){
                        go["district"] = localareaid;
                      }
                      go["imgs"] = imgs.toString();
                      go["content_img"] = content_img.toString();
                      postreleasePageContent(urls_release,go).then((val){
                        setState(() {
                          print(val); 
                        });
                      });
                      // Navigator.of(context).push(
                      //   new MaterialPageRoute(builder: (context) => new Navigatorpage()),
                      // );
                    }
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  child:Text('提交',style: TextStyle(fontSize: 20.0,color: Colors.white)),
                )
              )
            )
          )
        )
      ),
    );
  }
  void gosub(String text){
    showDialog<Null>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text(text, style: new TextStyle(fontSize: 17.0)),
        actions: <Widget>[
        new FlatButton(
          child: new Text('确定'),
          onPressed: (){
            print("确定");
            Navigator.of(context).pop();
          },
        ),
        ],
      );
      }
    );
  }
}

class AddBody extends StatefulWidget {
  final int iniindex;
  AddBody({Key key, this.iniindex}) : super(key: key);
  @override
  _AddBodyState createState() {
    return _AddBodyState();
  }
}
class _AddBodyState extends State<AddBody> {
  String dateTimesyear = "";
  String dateTimesmonth = "";
  String dateTimesday = "";
  String dateTimes = "";
  bool hhsisCheck = false;
  bool qyisCheck = false;

  void images(){
    if (imageing.length==null) {
      imageingl = 0;
    }else{
      imageingl = imageing.length;
    }
    print(imageingl);
  }
  void imagesx(){
    if (imageingx.length==null) {
      imageinglx = 0;
    }else{
      imageinglx = imageingx.length;
    }
    print(imageinglx);
  }

  void onDataChange(val) {
    setState(() {
    });
  }

  List<DropdownMenuItem> getListData(){
    List<DropdownMenuItem> items=new List();
    List<Widget>.generate(
      releasePageContent["unit"].length, (int index) {
        items.add(
          new DropdownMenuItem(
            child:new Text(releasePageContent["unit"][index]["name"]),
            value: releasePageContent["unit"][index]["id"].toString(),
          )
        );
      }
    );
    return items;
  }
  var value = releasePageContent["unit"][0]["id"].toString();

  List<DropdownMenuItem> getListTime(){
    List<DropdownMenuItem> items=new List();
    List<Widget>.generate(
      releasePageContent["validity"].length, (int index) {
        items.add(
          new DropdownMenuItem(
            child:new Text(releasePageContent["validity"][index]["name"]),
            value: releasePageContent["validity"][index]["id"],
          )
        );
      }
    );
    return items;
  }
  var valueTime = releasePageContent["validity"][0]["id"];

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView(
        scrollDirection: Axis.vertical,
        // controller: _controller,
        shrinkWrap: true, 
        children: <Widget>[
          new Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Container(
                height: 25.0,
                child: Row(
                  children: <Widget>[
                    Container(color:Colors.blue,width: 4.0,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                      child: Text('选择品种',style: TextStyles.TextStyle2(),),
                    ),
                  ],
                ),
              ),
              new Divider(height: 0,),
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: new FutureBuilder(
                  future: getreleasePageContent(urls_release,cons),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SelectMetalsOptions(callback: (val) => onDataChange(val));
                    } else if (snapshot.hasError) {
                      return new Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner
                    return new Center(
                      child:CircularProgressIndicator()
                    );
                  }
                ),
              ),
              Interval_space(),
              Container(
                height: 25.0,
                child: Row(
                  children: <Widget>[
                    Container(color:Colors.blue,width: 4.0,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                      child: Text('填写供应资源需求表格',style: TextStyles.TextStyle2(),),
                    ),
                  ],
                ),
              ),
              new Divider(height: 0,),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: new Column(
                  children: <Widget>[
                    Container(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon:Icon(Icons.title),
                          labelText: '发布标题',
                          labelStyle: TextStyle(fontSize: 15.0),
                          border: InputBorder.none,
                        ),
                        onChanged: (String text){
                          setState(() {
                            titleValue = text;
                          });
                        },
                      ),
                    ),
                    new Divider(height: 0,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (String text){
                                setState(() {
                                  numberValue = text;
                                });
                              },
                              decoration: const InputDecoration(
                                prefixIcon:Icon(Icons.inbox),
                                labelText: '需求数量',
                                labelStyle: TextStyle(fontSize: 15.0),
                                border: InputBorder.none,
                              ),
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: new DropdownButton(
                                items: getListData(),
                                hint:new Text(value),
                                style: new TextStyle(fontSize: 15,color: Colors.black),
                                value: value,
                                onChanged: (T){
                                  setState(() {
                                    value=T;
                                    unitValue=T;
                                  });
                                },
                                elevation: 1,
                                // isDense: true,
                                iconSize: 38.0,
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                    new Divider(height: 0,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (String text){
                                setState(() {
                                  priceValue = text;
                                });
                              },
                              decoration: const InputDecoration(
                                prefixIcon:Icon(Icons.credit_card),
                                labelText: '意向价格(¥)',
                                labelStyle: TextStyle(fontSize: 15.0),
                                border: InputBorder.none,
                              ),
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          // Expanded(
                          //   flex: 1,
                          //   child: Container(
                          //     child: Text(value)
                          //   )
                          // )
                        ],
                      ),
                    ),
                    new Divider(height: 0,),
                    Container(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (String text){
                          setState(() {
                            phoneValue = text;
                          });
                        },
                        decoration: const InputDecoration(
                          prefixIcon:Icon(Icons.phone_iphone),
                          labelText: '联系电话',
                          labelStyle: TextStyle(fontSize: 15.0),
                          border: InputBorder.none,
                        ),
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    new Divider(height: 0,),
                    Container(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon:Icon(Icons.sort_by_alpha),
                          labelText: '品名',
                          labelStyle: TextStyle(fontSize: 15.0),
                          border: InputBorder.none,
                        ),
                        onChanged: (String text){
                          setState(() {
                            nameValue = text;
                          });
                        },
                      ),
                    ),
                    new Divider(height: 0,),
                    Container(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon:Icon(Icons.sort_by_alpha),
                          labelText: '品位',
                          labelStyle: TextStyle(fontSize: 15.0),
                          border: InputBorder.none,
                        ),
                        onChanged: (String text){
                          setState(() {
                            oreValue = text;
                          });
                        },
                      ),
                    ),
                    new Divider(height: 0,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(11.0, 18.0, 18.0, 18.0),
                      child:Material(
                        color: Colors.white,
                        child: Ink(
                          child:InkWell(
                            onTap: (){
                              // Navigator.of(context).push(
                              //   new MaterialPageRoute(builder: (context) => new Province(iniindex:this.widget.iniindex)),
                              // );
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context){
                                  return Province(iniindex:this.widget.iniindex);
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                const Icon(Icons.location_on,color: Color(0xFF8b8b8b)),
                                Container(
                                  // width: 230,
                                  padding: const EdgeInsets.fromLTRB(13.0, 0.0, 0.0, 0.0),
                                  child:Row(
                                    // alignment: WrapAlignment.start,
                                    children: <Widget>[
                                    Text("交货地点: ",style: TextStyle(fontSize: 15.0,color: Color(0xFF8b8b8b)),),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
                                      child: Text(localhigh,style: TextStyle(fontSize: 13.0,color: Colors.black,),overflow: TextOverflow.ellipsis,),
                                    )
                                  ],)
                                ),
                              ],
                            ),
                          )
                        )
                      )
                    ),
                    new Divider(height: 0,),
                    this.widget.iniindex==1?Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child:Container(
                              padding: const EdgeInsets.fromLTRB(11.0, 18.0, 18.0, 18.0),
                                child: Row(
                                  children: <Widget>[
                                    const Icon(Icons.timer,color: Color(0xFF8b8b8b)),
                                    Container(
                                      // width: 230,
                                      padding: const EdgeInsets.fromLTRB(13.0, 0.0, 0.0, 0.0),
                                      child:Row(
                                        // alignment: WrapAlignment.start,
                                        children: <Widget>[
                                        Text("截止日期: ",style: TextStyle(fontSize: 15.0,color: Color(0xFF8b8b8b)),),
                                      ],)
                                    ),
                                  ],
                                ),
                              ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: new DropdownButton(
                                items: getListTime(),
                                hint:new Text(valueTime),
                                style: new TextStyle(fontSize: 15,color: Colors.black),
                                value: valueTime,
                                onChanged: (T){
                                  setState(() {
                                    valueTime=T;
                                    dataValue=T;
                                  });
                                },
                                elevation: 1,
                                // isDense: true,
                                iconSize: 38.0,
                              ),
                            )
                          )
                        ],
                      ),
                    ):Container(),
                    new Divider(height: 0,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 10),
                      child: TextField(
                        maxLength: 30,
                        maxLines: 2,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon:Icon(Icons.more),
                          labelText: '描述一下',
                          labelStyle: TextStyle(fontSize: 15.0),
                          border: InputBorder.none,
                        ),
                        onChanged: (text){
                          setState(() {
                           moreValue = text; 
                          });
                        },
                      ),
                    ),
                    new Divider(height: 0,),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child:Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 6.0,
                        runSpacing: 6.0,
                        children: List<Widget>.generate(
                          imageingl, (int index) {
                            return Ink(
                              child: InkWell(
                                onTap: (){
                                  showDialog<Null>(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                    return new AlertDialog(
                                      title: new Text('你确定要删除这张图片吗？', style: new TextStyle(fontSize: 17.0)),
                                      actions: <Widget>[
                                      new FlatButton(
                                        child: new Text('取消'),
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      new FlatButton(
                                        child: new Text('确定'),
                                        onPressed: (){
                                          setState(() {
                                          imageing.removeAt(index);  
                                          });
                                          images();
                                          Navigator.of(context).pop();
                                        },
                                      )
                                      ],
                                    );
                                    }
                                  );
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                                      width: 85.0,
                                      height: 90.0,
                                      child: Image.file(imageing[index],fit:BoxFit.cover,),
                                    ),
                                    Positioned(
                                      left: 70,
                                      top: -1,
                                      child:Icon(Icons.cancel,color: Colors.red,size: 25.0),
                                    ),
                                  ]
                                )
                              )
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      alignment: Alignment.topLeft,
                      child:Material( 
                        color: Colors.white,
                        child: Ink(
                          child: InkWell(
                            onTap: (){
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context){
                                  return new Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new ListTile(
                                        leading: new Icon(Icons.photo_camera),
                                        title: new Text("开启相机拍照"),
                                        onTap: () async {
                                          getImagecamera(true);
                                        },
                                      ),
                                      new ListTile(
                                        leading: new Icon(Icons.photo_library),
                                        title: new Text("选择相册照片"),
                                        onTap: () async {
                                          getImagegallery(true);
                                        },
                                      ),
                                    ],
                                  );
                                }
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.photo,color: Colors.blue,size: 100.0,),
                                Text("添加轮播图片",style: TextStyles.TextStyle4(),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    new Divider(height: 0,),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child:Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 6.0,
                        runSpacing: 6.0,
                        children: List<Widget>.generate(
                          imageinglx, (int index) {
                            return Ink(
                              child: InkWell(
                                onTap: (){
                                  showDialog<Null>(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                    return new AlertDialog(
                                      title: new Text('你确定要删除这张图片吗？', style: new TextStyle(fontSize: 17.0)),
                                      actions: <Widget>[
                                      new FlatButton(
                                        child: new Text('取消'),
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      new FlatButton(
                                        child: new Text('确定'),
                                        onPressed: (){
                                          setState(() {
                                            imageingx.removeAt(index); 
                                          });
                                          imagesx();
                                          Navigator.of(context).pop();
                                        },
                                      )
                                      ],
                                    );
                                    }
                                  );
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                                      width: 85.0,
                                      height: 90.0,
                                      child: Image.file(imageingx[index],fit:BoxFit.cover,),
                                    ),
                                    Positioned(
                                      left: 70,
                                      top: -1,
                                      child:Icon(Icons.cancel,color: Colors.red,size: 25.0),
                                    ),
                                  ]
                                )
                              )
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child:Material( 
                        color: Colors.white,
                        child: Ink(
                          child: InkWell(
                            onTap: (){
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context){
                                  return new Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new ListTile(
                                        leading: new Icon(Icons.photo_camera),
                                        title: new Text("开启相机拍照"),
                                        onTap: () async {
                                          getImagecamera(false);
                                        },
                                      ),
                                      new ListTile(
                                        leading: new Icon(Icons.photo_library),
                                        title: new Text("选择相册照片"),
                                        onTap: () async {
                                          getImagegallery(false);
                                        },
                                      ),
                                    ],
                                  );
                                }
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.photo,color: Colors.blue,size: 100.0,),
                                Text("添加详情图片",style: TextStyles.TextStyle4(),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ]
                ),
              ),
              ],
            ),
          )
        ]
      )
    );
  }
  Future getImagegallery(bool xs) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (xs==true) {
      setState(() {
        imageing.add(image);
        if(imageing[imageing.length-1]==null){
          imageing.removeAt(imageing.length-1);  
        }
      });
      images();
    }else{
      setState(() {
        imageingx.add(image);
        if(imageingx[imageingx.length-1]==null){
          imageingx.removeAt(imageingx.length-1);  
        }
      });
      imagesx();
    }
    if (image!=null) {
      postImageContent(image).then((val){
        setState(() {
          xs?imgs.add(val["mid"].toString()):content_img.add(val["mid"].toString());
        });
      });
    }
  }
  Future getImagecamera(bool xs) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    if (xs==true) {
      setState(() {
        imageing.add(image);
        if(imageing[imageing.length-1]==null){
          imageing.removeAt(imageing.length-1);  
        }
      });
      images();
    }else{
      setState(() {
        imageingx.add(image);
        if(imageingx[imageingx.length-1]==null){
          imageingx.removeAt(imageingx.length-1);  
        }
      });
      imagesx();
    }
    if (image!=null) {
      postImageContent(image).then((val){
        setState(() {
          xs?imgs.add(val["mid"].toString()):content_img.add(val["mid"].toString());
        });
      });
    }
  }
}

//品种
class SelectMetalsOptions extends StatefulWidget {

  SelectMetalsOptions({Key key, this.callback})
    :super(key: key);
  final callback;

  @override
  _SelectMetalsOptionsState createState() => _SelectMetalsOptionsState();
}
class _SelectMetalsOptionsState extends State<SelectMetalsOptions> {
  Map<int,bool> vt = new Map();
  void vts(){
    List<Widget>.generate(
      releasePageContent["variety"].length, (int index) {
        vt[index] = false;
      }
    );
  }
  @override
  void initState() { 
    super.initState();
    vts();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
        child:Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: List<Widget>.generate(
            releasePageContent["variety"].length, (int index) {
              return Ink(
                width: 85.0,
                height: 40.0,
                child:InkWell(
                  onTap: () {
                    setState(() {
                      vts();
                      vt[index]=true;
                      cateValue = releasePageContent["variety"][index]["id"];
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child:new Text(
                      releasePageContent["variety"][index]["name"],
                      overflow: TextOverflow.ellipsis,
                      style:new TextStyle(
                        fontSize: 14.0,
                        color: vt[index]==true?Colors.blue:Colors.black,
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
