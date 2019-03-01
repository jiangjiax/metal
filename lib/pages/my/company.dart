import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

final _controllername = TextEditingController();
final _controllerpeople = TextEditingController();
final _controllernumber = TextEditingController();
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

bool cma = true;//0:填写公司信息；1：等待；

class Company extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CompanyState();
  }
}

class CompanyState extends State<Company> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(cma?"填写公司信息":"核实中"),
        elevation: 0.0,
        actions: <Widget>[
          cma?new IconButton(icon: new Text("提交"), onPressed:(){
            if(_controllername.text==""){
              gosubit("公司名称不能为空",context);
            }else{
              if(_controllerpeople.text==""){
                gosubit("法人不能为空",context);
              }else{
                if(_controllernumber.text==""){
                  gosubit("营业执照号不能为空",context);
                }else{
                  if(imageingl==0){
                    gosubit("请添加营业执照照片",context);
                  }else{
                    setState(() {
                      cma=false;
                    });
                  }
                }
              }
            }
          }):new Container(),
        ],
      ),
      body:cma?CompanyYes():CompanyNo()
    );
  }
}

class CompanyNo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color(0xFFEEEEEE),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.more_horiz,color: Colors.blue,size: 30.0),
            Padding(padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),),
            new Text("正在核实企业",style: new TextStyle(fontSize: 20.0),)
          ],
        )
      )
    );
  }
}

class CompanyYes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CompanyYesState();
  }
}

class CompanyYesState extends State<CompanyYes> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: <Widget>[
            Container(
              child: TextField(
                controller: _controllername,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: '公司名称',
                  labelStyle: TextStyle(fontSize: 15.0),
                  border: InputBorder.none,
                ),
                onChanged: (String text){
                  setState(() {
                  });
                },
              ),
            ),
            ],
          ),
        ),
        new Divider(height: 0,),
        Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: <Widget>[
            Container(
              child: TextField(
                controller: _controllerpeople,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: '法人',
                  labelStyle: TextStyle(fontSize: 15.0),
                  border: InputBorder.none,
                ),
                onChanged: (String text){
                  setState(() {
                  });
                },
              ),
            ),
            ],
          ),
        ),
        new Divider(height: 0,),
        Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: <Widget>[
            Container(
              child: TextField(
                controller: _controllernumber,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: '营业执照号',
                  labelStyle: TextStyle(fontSize: 15.0),
                  border: InputBorder.none,
                ),
                onChanged: (String text){
                  setState(() {
                  });
                },
              ),
            ),
            ],
          ),
        ),
        Interval_space(),
        Container(
          color: Colors.white,
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                          color: Colors.white,
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
            child:Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                    Text("添加营业执照图片",style: TextStyles.TextStyle4(),),
                  ],
                ),
              ),
            ),
            ),
          ),
        new Divider(height: 0,),
      ]
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

