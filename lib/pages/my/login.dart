import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metal/data/global_config.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:metal/data/global_home.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

int time = 60;
Timer _timer;
var fas = "发送验证码";
  
class LoginPage extends StatefulWidget {
  @override
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage> {

  final _userNameController=TextEditingController();
  final _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Navigator.of(context).popAndPushNamed('/index');
                },
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          TextField(
            controller: _userNameController,
            keyboardType: TextInputType.number,
            onChanged: (String text){
            },
            decoration: const InputDecoration(
              prefixIcon:Icon(Icons.phone_android),
              labelText: '手机号',
              labelStyle: TextStyle(fontSize: 15.0),
              border: InputBorder.none,
            ),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          new Divider(height: 0,color: Color(0xFF9E9E9E),),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            keyboardType: TextInputType.number,
            onChanged: (String text){
            },
            decoration: const InputDecoration(
              prefixIcon:Icon(Icons.remove_red_eye),
              labelText: '密码',
              labelStyle: TextStyle(fontSize: 15.0),
              border: InputBorder.none,
            ),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          new Divider(height: 0,color: Color(0xFF9E9E9E),),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Ink(
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed('/loginyzm');
                  },
                  child:Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text("手机验证码登陆",style: TextStyles.TextStyle3(),),
                  ),
                )
              ),
              Ink(
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed('/loginpassword');
                  },
                  child:Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Text("? 忘记密码",style: TextStyles.TextStyle3(),),
                  ),
                )
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
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
                  if (_userNameController.text=="") {
                    gosub("手机号不能为空");
                  }else{
                    if(_passwordController.text==""){
                      gosub("密码不能为空");
                    }else{
                      setState(() {
                        postyzm("http://zhexinjs.com/app/login/account",{"mobile":_userNameController.text.toString(),"password":_passwordController.text.toString()}).then((val){
                          setState(() {
                            print(val);
                          });
                        });
                      });
                      print(loginstatus);
                      if (loginstatus==1) {
                        showDialog<Null>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                          return new AlertDialog(
                            title: new Text("登陆成功!", style: new TextStyle(fontSize: 17.0)),
                            actions: <Widget>[
                            new FlatButton(
                              child: new Text('确定'),
                              onPressed: (){
                                print("确定");
                                // Navigator.of(context).pushNamed('/logingo');
                              },
                            ),
                            ],
                          );
                          }
                        );
                      }
                    }
                  }
                },
                child: Text('登陆',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("第三方账号登录",style: TextStyles.TextStyle3()),
                Loginwx(),
                Text("微信",style: TextStyles.TextStyle3()),
              ],
            ),
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
  final _userNameController=TextEditingController();
  final _passwordController=TextEditingController();
  final _passwordControllerRe=TextEditingController();
  final _yzmController=TextEditingController();

  void startTime() {
    fas = "已发送 $time";
    _timer = new Timer.periodic(const Duration(seconds: 1), (timer){
      setState(() {
        time--;
        fas = "已发送 $time";
        if(time<1){
          stopTime();
        }
      });
    });
  }

  void stopTime() {
    if (_timer != null) {
      _timer.cancel();
    }
    setState(() {
      fas = "发送验证码";
      time = 60;
    });
    _timer = null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stopTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _userNameController,
                    keyboardType: TextInputType.number,
                    onChanged: (String text){
                    },
                    decoration: const InputDecoration(
                      prefixIcon:Icon(Icons.phone_android),
                      labelText: '手机号',
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
                    child:new OutlineButton(
                      onPressed: (){
                        setState(() {
                          postyzm("http://zhexinjs.com/app/sends",{"mobile":_userNameController.text.toString(),"type":"0"}).then((val){
                            setState(() {
                              if(loginstatus==0){
                                gosub("手机号输入错误");
                              }else{
                                startTime();
                              }
                            });
                          });
                        });
                      },
                      child: Text(fas),
                    ),
                  )
                )
              ],
            ),
          ),
          new Divider(height: 0,color: Color(0xFF9E9E9E),),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            keyboardType: TextInputType.number,
            onChanged: (String text){
            },
            decoration: const InputDecoration(
              prefixIcon:Icon(Icons.remove_red_eye),
              labelText: '密码',
              labelStyle: TextStyle(fontSize: 15.0),
              border: InputBorder.none,
            ),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          new Divider(height: 0,color: Color(0xFF9E9E9E),),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _passwordControllerRe,
            obscureText: true,
            keyboardType: TextInputType.number,
            onChanged: (String text){
            },
            decoration: const InputDecoration(
              prefixIcon:Icon(Icons.remove_red_eye),
              labelText: '确认密码',
              labelStyle: TextStyle(fontSize: 15.0),
              border: InputBorder.none,
            ),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          new Divider(height: 0,color: Color(0xFF9E9E9E),),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _yzmController,
            obscureText: true,
            keyboardType: TextInputType.number,
            onChanged: (String text){
            },
            decoration: const InputDecoration(
              prefixIcon:Icon(Icons.speaker_notes),
              labelText: '验证码',
              labelStyle: TextStyle(fontSize: 15.0),
              border: InputBorder.none,
            ),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          new Divider(height: 0,color: Color(0xFF9E9E9E),),
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
                  if (_userNameController.text=="") {
                    gosub("手机号不能为空");
                    print("a");
                  }else if (_userNameController.text.length<4) {
                    gosub("请输入正确的手机号");
                  }else if(_passwordController.text==""){
                    gosub("密码不能为空");
                  }else if(_passwordController.text.length<6){
                    gosub("密码长度要大于6位");
                  }else if(_passwordControllerRe.text!=_passwordController.text){
                    gosub("确认密码不正确");
                    print(yzm);
                  }else if(_yzmController.text==""){
                    gosub("验证码不能为空");
                    print(_yzmController.text==yzm);
                      print("a");
                  }else if(_yzmController.text==yzm){
                    setState(() {
                      postyzm("http://zhexinjs.com/app/register",{"mobile":_userNameController.text.toString(),"password":_passwordControllerRe.text.toString()}).then((val){
                        setState(() {
                        });
                      });
                    });
                    showDialog<Null>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                      return new AlertDialog(
                        title: new Text("注册成功!", style: new TextStyle(fontSize: 17.0)),
                        actions: <Widget>[
                        new FlatButton(
                          child: new Text('确定'),
                          onPressed: (){
                            print("确定");
                            Navigator.of(context).pushNamed('/logingo');
                          },
                        ),
                        ],
                      );
                      }
                    );
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

class LoginyzmPage extends StatefulWidget {
  @override
  _LoginyzmPageState createState() => _LoginyzmPageState();
}

class _LoginyzmPageState extends State<LoginyzmPage> {

  @override
  void initState() {
    super.initState();
    stopTime();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void startTime() {
    fas = "已发送 $time";
    _timer = new Timer.periodic(const Duration(seconds: 1), (timer){
      setState(() {
        time--;
        fas = "已发送 $time";
        if(time<1){
          stopTime();
        }
      });
    });
  }

  void stopTime() {
    if (_timer != null) {
      _timer.cancel();
    }
    setState(() {
      fas = "发送验证码";
      time = 60;
    });
    _timer = null;
  }

  final _userNameController=TextEditingController();
  final _yzmController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _userNameController,
                    keyboardType: TextInputType.number,
                    onChanged: (String text){
                    },
                    decoration: const InputDecoration(
                      prefixIcon:Icon(Icons.phone_android),
                      labelText: '手机号',
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
                    child:new OutlineButton(
                      onPressed: (){
                        setState(() {
                          postyzm("http://zhexinjs.com/app/sends",{"mobile":_userNameController.text.toString(),"type":"1"}).then((val){
                            setState(() {
                              if(loginstatus==0){
                                gosub("手机号输入错误");
                              }else{
                                startTime();
                              }
                            });
                          });
                        });
                      },
                      child: Text(fas),
                    ),
                  )
                )
              ],
            ),
          ),
          new Divider(height: 0,color: Color(0xFF9E9E9E),),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _yzmController,
            obscureText: true,
            keyboardType: TextInputType.number,
            onChanged: (String text){
            },
            decoration: const InputDecoration(
              prefixIcon:Icon(Icons.speaker_notes),
              labelText: '验证码',
              labelStyle: TextStyle(fontSize: 15.0),
              border: InputBorder.none,
            ),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          new Divider(height: 0,color: Color(0xFF9E9E9E),),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Ink(
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed('/logingo');
                  },
                  child:Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text("密码登陆",style: TextStyles.TextStyle3(),),
                  ),
                )
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
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
                  if (_userNameController.text=="") {
                    gosub("手机号不能为空");
                  }else{
                    if(_yzmController.text!=yzm){
                      gosub("验证码错误");
                    }else{
                      setState(() {
                        postyzm("http://zhexinjs.com/app/login/sms",{"mobile":_userNameController.text.toString()}).then((val){
                          setState(() {
                            print(val);
                          });
                        });
                      });
                      print(loginstatus);
                      if (loginstatus==1) {
                        showDialog<Null>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                          return new AlertDialog(
                            title: new Text("登陆成功!", style: new TextStyle(fontSize: 17.0)),
                            actions: <Widget>[
                            new FlatButton(
                              child: new Text('确定'),
                              onPressed: (){
                                print("确定");
                                // Navigator.of(context).pushNamed('/logingo');
                              },
                            ),
                            ],
                          );
                          }
                        );
                      }
                    }
                  }
                },
                child: Text('登陆',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("第三方账号登录",style: TextStyles.TextStyle3()),
                Loginwx(),
                Text("微信",style: TextStyles.TextStyle3()),
              ],
            ),
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

saveuid(uid) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("uid", uid);
}

Future<String> get() async {
  var userName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = await prefs.getString("uid");
  return userName;
}

class Loginwx extends StatefulWidget {
  @override
  _SendAuthPageState createState() => _SendAuthPageState();
}

class _SendAuthPageState extends State<Loginwx> {
  String _results = "无";
  String _result = "无";

  @override
  void initState() {
    super.initState();
    _initFluwx();
    fluwx.responseFromAuth.listen((data) {
      // setState(() {
        if(mounted) {
          setState(() {
            _result = "${data.errCode}";
            _results = "${data.code}";
            if(_result=="0"){
              postyzm("http://zhexinjs.com/app/login/wechat",{"code":_results,}).then((val){
                setState(() {
                   saveuid(uid);
                });
              });
            }
          });
        }
      // });
    });
    Future<String> uids = get();
    uids.then((uids) {
      uidvalue=uids;
      // Scaffold.of(context).showSnackBar(
      //       SnackBar(content: Text("数据获取成功：$uidvalue")));
      print(uidvalue);
    });
  }

  _initFluwx() async{
    await fluwx.register(appId: "wxf0d41be8d1e4189a", doOnAndroid: true, doOnIOS: true, enableMTA: false);
    var result = await fluwx.isWeChatInstalled();
    print("is installed $result");
  }

  @override
  void dispose() {
    super.dispose();
    _result = null;
  }

  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: (){
          fluwx.sendAuth(
            scope: "snsapi_userinfo", state: "wechat_sdk_demo_test")
            .then((data) {
              print(data);
          });
        },
        child:Container(
          padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
          width: 100,
          child: new Image.asset(
            "images/wx.png",
          ),
        ),
      )
    );
  }
}

class Passwordlogin extends StatefulWidget {
  @override
  _PasswordwxPageState createState() => _PasswordwxPageState();
}

class _PasswordwxPageState extends State<Passwordlogin> {

  final _userNameController=TextEditingController();
  final _passwordController=TextEditingController();
  final _passwordControllerRe=TextEditingController();
  final _yzmController=TextEditingController();

  void startTime() {
    fas = "已发送 $time";
    _timer = new Timer.periodic(const Duration(seconds: 1), (timer){
      setState(() {
        time--;
        fas = "已发送 $time";
        if(time<1){
          stopTime();
        }
      });
    });
  }

  void stopTime() {
    if (_timer != null) {
      _timer.cancel();
    }
    setState(() {
      fas = "发送验证码";
      time = 60;
    });
    _timer = null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stopTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _userNameController,
                    keyboardType: TextInputType.number,
                    onChanged: (String text){
                    },
                    decoration: const InputDecoration(
                      prefixIcon:Icon(Icons.phone_android),
                      labelText: '手机号',
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
                    child:new OutlineButton(
                      onPressed: (){
                        setState(() {
                          postyzm("http://zhexinjs.com/app/sends",{"mobile":_userNameController.text.toString(),"type":"0"}).then((val){
                            setState(() {
                              if(loginstatus==0){
                                gosub("手机号输入错误");
                              }else{
                                startTime();
                              }
                            });
                          });
                        });
                      },
                      child: Text(fas),
                    ),
                  )
                )
              ],
            ),
          ),
          new Divider(height: 0,color: Color(0xFF9E9E9E),),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            keyboardType: TextInputType.number,
            onChanged: (String text){
            },
            decoration: const InputDecoration(
              prefixIcon:Icon(Icons.remove_red_eye),
              labelText: '密码',
              labelStyle: TextStyle(fontSize: 15.0),
              border: InputBorder.none,
            ),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          new Divider(height: 0,color: Color(0xFF9E9E9E),),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _passwordControllerRe,
            obscureText: true,
            keyboardType: TextInputType.number,
            onChanged: (String text){
            },
            decoration: const InputDecoration(
              prefixIcon:Icon(Icons.remove_red_eye),
              labelText: '确认密码',
              labelStyle: TextStyle(fontSize: 15.0),
              border: InputBorder.none,
            ),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          new Divider(height: 0,color: Color(0xFF9E9E9E),),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _yzmController,
            obscureText: true,
            keyboardType: TextInputType.number,
            onChanged: (String text){
            },
            decoration: const InputDecoration(
              prefixIcon:Icon(Icons.speaker_notes),
              labelText: '验证码',
              labelStyle: TextStyle(fontSize: 15.0),
              border: InputBorder.none,
            ),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          new Divider(height: 0,color: Color(0xFF9E9E9E),),
          SizedBox(
            height: 12.0,
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/logingo');
                },
                child: Text('返回登陆'),
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  if (_userNameController.text=="") {
                    gosub("手机号不能为空");
                  }else if (_userNameController.text.length<4) {
                    gosub("请输入正确的手机号");
                  }else if(_passwordController.text==""){
                    gosub("密码不能为空");
                  }else if(_passwordController.text.length<6){
                    gosub("密码长度要大于6位");
                  }else if(_passwordControllerRe.text!=_passwordController.text){
                    gosub("确认密码不正确");
                    print(yzm);
                  }else if(_yzmController.text==""){
                    gosub("验证码不能为空");
                  }else if(_yzmController.text==yzm){
                    setState(() {
                      postyzm("http://zhexinjs.com/app/resetpwd",{"mobile":_userNameController.text.toString(),"password":_passwordControllerRe.text.toString()}).then((val){
                        setState(() {
                        });
                      });
                    });
                    showDialog<Null>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                      return new AlertDialog(
                        title: new Text("重置密码成功!", style: new TextStyle(fontSize: 17.0)),
                        actions: <Widget>[
                        new FlatButton(
                          child: new Text('确定'),
                          onPressed: (){
                            print("确定");
                            Navigator.of(context).pushNamed('/logingo');
                          },
                        ),
                        ],
                      );
                      }
                    );
                  }
                },
                child: Text('重置密码',style: TextStyle(color: Colors.white),),
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
