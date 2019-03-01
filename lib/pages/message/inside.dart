import 'package:flutter/material.dart';
import 'package:metal/pages/message/chat.dart';

class Inside extends StatefulWidget {
  @override
  _InsideState createState() {
    return _InsideState();
  }
}
class _InsideState extends State<Inside> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChatRoom(index: 3,),
    );
  }
}