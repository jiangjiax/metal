import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:io';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/my/user.dart';

class ChatMessageData {
  final String id;
  final String msg;
  final DateTime created;
  final String name;
  final int role;

  ChatMessageData(
    this.id,
    this.msg,
    this.name,
    this.role,
    this.created,
  );

  static ChatMessageData formMap(Map map) => ChatMessageData(
    map['id'],
    map['msg'],
    map['name'],
    map['role'],
    DateTime.fromMicrosecondsSinceEpoch(map['created'])
  );

  Map toMap() => {
    "id": id,
    "msg": msg,
    "name": name,
    "created": created.millisecondsSinceEpoch
  };

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => toMap().toString();

  Color getStatusColor() {
    switch (role) {
      case 2:
        return Colors.blue;
      case -1:
        return Colors.grey;
      case 0:
        return Colors.black;
      case 1:
        return Colors.orangeAccent;
      case 2:
        return Colors.deepOrange;
      case 3:
        return Colors.pink;
    }
    return Colors.white;
  }
}

class User {
  final String userName; //用户名
  final String uuid; //uuid
  final String avatar; //头像
  final int role;

  User({this.userName, this.uuid, this.avatar, this.role});

  Color getStatusColor() {
    switch (role) {
      case 2:
        return Colors.blue;
      case -1:
        return Colors.grey;
      case 0:
        return Colors.black;
      case 1:
        return Colors.orangeAccent;
      case 2:
        return Colors.deepOrange;
      case 3:
        return Colors.pink;
    }
    return Colors.white;
  }
}

const isOpenNetWork=false;


class ChatRoom extends StatefulWidget {
  ChatRoom({Key key, this.index}) : super(key: key);
  final int index;

  static const String routeName = 'design/ChatRoom';

  final User user = User(
    userName: 'rhyme',
    role: 1,
    uuid: '1234',
    avatar:
    'images/star.jpg',
  );

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> with TickerProviderStateMixin {
  final TextEditingController _controller = new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  static User users = User(
    userName: 'rhyme',
    role: 1,
    uuid: '1234',
    avatar:'images/star.jpg',
  );
  static ChatMessage message = ChatMessage(
    user: users,
    text: "你好",
  );
  static ChatMessageData datas = ChatMessageData(
    "id",
    "你好，能适旗舰店。",
    "能适旗舰店",
    3,
    DateTime.now(),
  );
  static RChatMessage rmessage = RChatMessage(
    data: datas,
  );

  final List<Widget> _message = <Widget>[
    rmessage,
    rmessage,
    rmessage,
    rmessage,
    rmessage,
    message,
  ];
  

  bool haveText = false;
  WebSocket socket;

  @override
  void initState() {
    super.initState();
  }

  getHeaders() {}

  // void login() {
  //   httpManager.webSocket(url: 'ws://192.168.1.101:8080/mini/connect',
  //   headers: getHeaders(),
  //   onSend: (){
  //     scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text('开始连接服务器!')));
  //   },
  //   onSuccess: (webSocket){
  //     this.socket = socket;
  //     socket.listen((data) {
  //       print(data);
  //       Map map = json.decode(data);
  //       ChatMessageData msg=ChatMessageData.formMap(map);
  //       if(msg.id!=widget.user.uuid){
  //         _handleGetMessage(msg);
  //       }
  //     });
  //   },
  //   onDone: (info){
  //     scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text('连接服务器中断!')));
  //   },
  //   onError: (error){
  //     scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text('连接失败!')));
  //   });
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(GlobalMy.myFollow[this.widget.index].name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person,color: Colors.white,),
            onPressed: (){
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => new Users(index: this.widget.index,)),
              );
            },
          )
        ],
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemBuilder: (_, int index) => _message[index],
              reverse: true,
              itemCount: _message.length,
              padding: const EdgeInsets.all(10.0),
            )
          ),
          Divider(height: 0,),
          _buildInputBox(),
        ],
      ),
    );
  }

  Widget _buildInputBox() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  haveText = value.isNotEmpty;
                });
              },
              controller: _controller,
              onSubmitted: _handSubmitted,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: haveText ? _handSend : null,
            ),
          )
        ],
      ),
    );
  }

  void _handSubmitted(String value) {
    if (value.isEmpty) {
      return;
    }
    _controller.clear();
    ChatMessage message = ChatMessage(
      user: widget.user,
      text: value,
      controller: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      ),
    );
    setState(() {
      haveText = false;
      _message.insert(0, message);
    });

    if (message.controller != null) {
      message.controller.forward();
    }
    // if(socket!=null){
    //   socket.add(new ChatMessageData(widget.user.uuid, value, widget.user.userName, widget.user.role, DateTime.now()).toJson());
    // }
  }

  void _handSend() {
    _handSubmitted(_controller.text);
  }

  _handleGetMessage(ChatMessageData data) {
    if (data == null) {
      return;
    }
    _controller.clear();
    RChatMessage message = RChatMessage(
      data: data,
      controller: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      ),
    );
    setState(() {
      _message.insert(0, message);
    });
    if (message.controller != null) {
      message.controller.forward();
    }
  }
  @override
  void dispose() {
    if(socket !=null){
      //退出当前页面后停止socket
      socket.close();
    }
    //释放动画
    for (Widget message in _message) {
      if (message is ChatMessage) {
        if (message.controller != null) {
          message.controller.dispose();
        }
      } else if (message is RChatMessage) {
        if (message.controller != null) {
          message.controller.dispose();
        }
      }
    }
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget {
  final User user;
  final String text;
  final AnimationController controller;

  const ChatMessage(
      {Key key, this.user, this.text, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            style: Theme.of(context).textTheme.subhead.copyWith(
                                color: user.getStatusColor(), fontSize: 10.0),
                          ),
                          TextSpan(
                            style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 12.0,
                            ),
                            text: user.userName,
                          ),
                        ],
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    shape: BoxShape.rectangle,
                    color: Colors.lightBlueAccent,
                  ),
                  child: Text(text),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            child: CircleAvatar(
              child: Text(user.userName.substring(0, 1).toUpperCase()),
            ),
          ),
        ],
      ),
    );
    if (controller != null) {
      body = SizeTransition(
        sizeFactor: CurvedAnimation(parent: controller, curve: Curves.easeOut),
        axisAlignment: -1.0,
        child: FadeTransition(
          opacity: CurvedAnimation(parent: controller, curve: Curves.easeOut),
          child: body,
        ),
      );
    }
    return body;


  }
}

class RChatMessage extends StatelessWidget {
  final ChatMessageData data;
  final AnimationController controller;

  const RChatMessage({
    Key key,
    this.data,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            child: CircleAvatar(
              child: Text(data.name.substring(0,1).toUpperCase()),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              color: data.getStatusColor(), fontSize: 10.0),
                        ),
                        TextSpan(
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 12.0
                          ),
                          text: data.name,
                        ),
                      ],
                    )),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    shape: BoxShape.rectangle,
                    color: Colors.lightBlueAccent,
                  ),
                  child: Text(data.msg),
                )
              ],
            ),
          ),
        ],
      ),
    );
    if (controller != null) {
      body = SizeTransition(
        sizeFactor: CurvedAnimation(parent: controller, curve: Curves.easeOut),
        axisAlignment: -1.0,
        child: FadeTransition(
          opacity: CurvedAnimation(parent: controller, curve: Curves.easeOut),
          child: body,
        ),
      );
    }
    return body;
  }
}