import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage> {
  // static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();
  final _userNameController=TextEditingController();
  final _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _globalKey,
      body: SafeArea(
        child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          Column(
            children: <Widget>[
              IconButton(
                icon: new Image.asset(
                  "images/logo.png",
                  fit: BoxFit.fill,
                ),
                iconSize: 60,
                onPressed: (){
                },
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          TextField(
            controller: _userNameController,
            decoration: InputDecoration(
              labelText: '用户名',
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: '密码',
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/logins');
                },
                child: Text('注册'),
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  print(_userNameController.text);
                  print(_passwordController.text);
                  if (_userNameController.text=="") {
                    gosub("用户名不能为空");
                  }else{
                    if(_passwordController.text==""){
                      gosub("密码不能为空");
                    }
                  }
                },
                child: Text('登陆',style: TextStyle(color: Colors.white),),
              ),
            ],
          )
        ],
      )),
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

class LoginsPage extends StatefulWidget {
  @override
  _LoginsPageState createState() => _LoginsPageState();
}

class _LoginsPageState extends State<LoginsPage> {
  // static GlobalKey<ScaffoldState> _globalKeys = new GlobalKey();
  final _userNameController=TextEditingController();
  final _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _globalKeys,
      body: SafeArea(
        child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          Column(
            children: <Widget>[
              IconButton(
                icon: new Image.asset(
                  "images/logo.png",
                  fit: BoxFit.fill,
                ),
                iconSize: 60,
                onPressed: (){
                },
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          TextField(
            controller: _userNameController,
            decoration: InputDecoration(
              labelText: '用户名',
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: '密码',
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: '确认密码',
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: '手机号',
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/logingo');
                },
                child: Text('直接登陆'),
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  print(_userNameController.text);
                  print(_passwordController.text);
                  if (_userNameController.text=="") {
                    gosub("用户名不能为空");
                  }else{
                    if(_passwordController.text==""){
                      gosub("密码不能为空");
                    }
                  }
                },
                child: Text('注册',style: TextStyle(color: Colors.white),),
              ),
            ],
          )
        ],
      )),
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
