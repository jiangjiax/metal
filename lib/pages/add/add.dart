import 'package:flutter/material.dart';
import 'package:metal/pages/newprice/newprice.dart';
import 'package:metal/data/global_config.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

//value
String titleValue = "";
String numberValue = "";
String unitValue = "公斤";
String phoneValue = "";
String localValue = "";
String dataValue = "";
String selectValue = "";
String moreValue = "";
String cateValue = "";

class Add extends StatefulWidget {
  @override
  _AddState createState() {
    return _AddState();
  }
}
class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
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
            AddBody(),
            AddBody(),
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
                  bool valuebool = titleValue==""||numberValue==""||unitValue==""||phoneValue==""||
                    localValue==""||dataValue==""||selectValue=="";
                  bool catebool = cateValue=="";
                  if(catebool==true){
                    gosub('请选择品种');
                  }else{
                    if (valuebool==true) {
                      gosub('填写供应资源需求表格不能为空');
                    }else{
                      gosub('发布成功!');
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

  List<DropdownMenuItem> getListData(){
    List<DropdownMenuItem> items=new List();
    DropdownMenuItem dropdownMenuItem1=new DropdownMenuItem(
      child:new Text('公斤'),
      value: '公斤',
    );
    items.add(dropdownMenuItem1);
    DropdownMenuItem dropdownMenuItem2=new DropdownMenuItem(
      child:new Text('个'),
      value: '个',
    );
    items.add(dropdownMenuItem2);
    DropdownMenuItem dropdownMenuItem3=new DropdownMenuItem(
      child:new Text('吨'),
      value: '吨',
    );
    items.add(dropdownMenuItem3);
    DropdownMenuItem dropdownMenuItem4=new DropdownMenuItem(
      child:new Text('米'),
      value: '米',
    );
    items.add(dropdownMenuItem4);
    DropdownMenuItem dropdownMenuItem5=new DropdownMenuItem(
      child:new Text('台'),
      value: '台',
    );
    items.add(dropdownMenuItem5);
    DropdownMenuItem dropdownMenuItem6=new DropdownMenuItem(
      child:new Text('克'),
      value: '克',
    );
    items.add(dropdownMenuItem6);
    return items;
  }
  var value = '公斤';

  List<File> imageing = [];
  int imageingl = 0;

  void images(){
    if (imageing.length==null) {
      imageingl = 0;
    }else{
      imageingl = imageing.length;
    }
    print(imageingl);
  }

  void onDataChange(val) {
    setState(() {
      cateValue = val;
    });
  }
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
                child: SelectMetalsOptions(callback: (val) => onDataChange(val)),
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
                        onChanged: (String text){
                          setState(() {
                            localValue = text;
                          });
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon:Icon(Icons.location_on),
                          labelText: '交货地点',
                          labelStyle: TextStyle(fontSize: 15.0),
                          border: InputBorder.none,
                        ),
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
                              showDatePicker(
                                  context: context,
                                  initialDate: new DateTime.now(),
                                  firstDate: new DateTime(new DateTime.now().year), 
                                  lastDate: new DateTime.now().add(new Duration(days: 3000)),     
                              ).then((DateTime val) {
                                  setState(() {
                                    dateTimesyear=val.year.toString();
                                    dateTimesmonth=val.month.toString();
                                    dateTimesday=val.day.toString();
                                    dateTimes = dateTimesyear + "-" + dateTimesmonth + "-" + dateTimesday;
                                    dataValue = dateTimes;
                                  });
                              }).catchError((err) {
                                  print(err);
                                  setState(() {
                                    dateTimes = "";
                                    dataValue = dateTimes;
                                  });
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                const Icon(Icons.event_seat,color: Color(0xFF8b8b8b)),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(13.0, 0.0, 0.0, 0.0),
                                  child:Row(children: <Widget>[
                                    Text("截止日期: ",style: TextStyle(fontSize: 15.0,color: Color(0xFF8b8b8b)),),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
                                      child: Text(dateTimes,style: TextStyle(fontSize: 15.0,color: Colors.black,)),
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
                    Container(
                      padding: const EdgeInsets.fromLTRB(11.0, 11.0, 0.0, 0.0),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              const Icon(Icons.power,color: Color(0xFF8b8b8b)),
                              Container(
                                padding: const EdgeInsets.fromLTRB(13.0, 0.0, 0.0, 0.0),
                                child:Text("资源性质: ",style: TextStyle(fontSize: 15.0,color: Color(0xFF8b8b8b)),),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.fromLTRB(24.0, 0.0, 0.0, 0.0),
                                child: Checkbox(
                                  value: hhsisCheck,
                                  activeColor: Colors.red,
                                  onChanged: (bool){
                                    setState(() {
                                      hhsisCheck=bool;
                                      qyisCheck=false;
                                      if(hhsisCheck==true){
                                        selectValue = "回收商废料";
                                      }
                                      print(selectValue);
                                    });
                                  },
                                ),
                              ),
                              Text('回收商废料'),
                              Container(
                                padding: const EdgeInsets.fromLTRB(24.0, 0.0, 0.0, 0.0),
                                child: Checkbox(
                                  value: qyisCheck,
                                  activeColor: Colors.red,
                                  onChanged: (bool){
                                    setState(() {
                                      qyisCheck=bool;
                                      hhsisCheck=false;
                                      if(qyisCheck==true){
                                        selectValue = "企业废料";
                                      }
                                      print(selectValue);
                                    });
                                  },
                                ),
                              ),
                              Text('企业废料')
                            ],
                          ),
                        ],
                      )
                    ),
                    new Divider(height: 0,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
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
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                                          print("取消");
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
                                  print(index);
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
                                    )
                                  ]
                                )
                              )
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    Material( 
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
                                        getImagecamera();
                                      },
                                    ),
                                    new ListTile(
                                      leading: new Icon(Icons.photo_library),
                                      title: new Text("选择相册照片"),
                                      onTap: () async {
                                        getImagegallery();
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
                              Text("添加图片",style: TextStyles.TextStyle4(),),
                            ],
                          ),
                        ),
                      ),
                    ),
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
  Future getImagegallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageing.add(image);
      if(imageing[imageing.length-1]==null){
        imageing.removeAt(imageing.length-1);  
      }
    });
    print(image);
    print(imageing);
    images();
    print(imageingl);
  }
  Future getImagecamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      imageing.add(image);
      if(imageing[imageing.length-1]==null){
        imageing.removeAt(imageing.length-1);  
      }
    });
    images();
  }
}
