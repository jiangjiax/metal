import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';

class Filterbar extends StatefulWidget {
  Filterbar({Key key, this.globals}) : super(key: key);

  final GlobalKey<ScaffoldState> globals;
  
  @override
  _FilterbarState createState() {
    return _FilterbarState();
  }
}

class _FilterbarState extends State<Filterbar> {
  Color _textColorEntire = GlobalButton.textColorAfter;
  Color _textColoNew = GlobalButton.textColorBefore;
  Color _textColorNumber = GlobalButton.textColorBefore;
  Color _textColorSelect = GlobalButton.textColorBefore;
  Color _backColorEntire = GlobalButton.backColorAfter;
  Color _backColoNew = GlobalButton.backColorBefore;
  Color _backColorNumber = GlobalButton.backColorBefore;
  Color _backColorSelect = GlobalButton.backColorBefore;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: new Container(
              height: 40.0,
              child: new FlatButton(
                child: Text("综合",style: TextStyles.TextStyle1(),),
                onPressed: () {
                  onFlatButton(1,context);
                  print('综合');
                },
                textTheme: ButtonTextTheme.accent,
                textColor: _textColorEntire,
                highlightColor: Colors.blue,
                // 按下的背景色
                splashColor: Colors.blue,
                color: _backColorEntire,
                shape: BorderDirectional(
                  end: new BorderSide(color: Color(0xFFEEEEEE)),
                ),
                // 水波纹颜色
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: new Container(
              height: 40.0,
              child: new FlatButton(
                child: Text("最新",style: TextStyles.TextStyle1(),),
                onPressed: () {
                  onFlatButton(2,context);
                  print('最新');
                },
                textTheme: ButtonTextTheme.accent,
                textColor: _textColoNew,
                highlightColor: Colors.blue,
                // 按下的背景色
                splashColor: Colors.blue,
                color: _backColoNew,
                shape: BorderDirectional(
                  end: new BorderSide(color: Color(0xFFEEEEEE),),
                  // top: new BorderSide(color: Color(0xFFE0E0E0),),
                  // bottom: new BorderSide(color: Color(0xFFE0E0E0),),
                ),
                // 水波纹颜色
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: new Container(
              height: 40.0,
              child: new FlatButton(
                child: Text("最热",style: TextStyles.TextStyle1(),),
                onPressed: () {
                  onFlatButton(3,context);
                  print('最热');
                },
                textTheme: ButtonTextTheme.accent,
                textColor: _textColorNumber,
                highlightColor: Colors.blue,
                // 按下的背景色
                splashColor: Colors.blue,
                color: _backColorNumber,
                shape: BorderDirectional(
                  end: new BorderSide(color: Color(0xFFEEEEEE),),
                ),
                // 水波纹颜色
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: new Container(
              height: 40.0,
              child: new FlatButton(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("筛选",style: TextStyles.TextStyle1(),),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child:Icon(Icons.select_all,color: _textColorSelect,),
                    )
                  ]
                ),
                onPressed: () {
                  onFlatButton(4,context);
                  print('筛选');
                  widget.globals.currentState.openEndDrawer();
                },
                textTheme: ButtonTextTheme.accent,
                textColor: _textColorSelect,
                highlightColor: Colors.blue,
                // 按下的背景色
                splashColor: Colors.blue,
                color: _backColorSelect,
                shape: BorderDirectional(
                  // top: new BorderSide(color: Color(0xFFE0E0E0),),
                  // bottom: new BorderSide(color: Color(0xFFE0E0E0),),
                ),
                // 水波纹颜色
              ),
            ),
          ),
        ],
      ),
    );
  }
  void onFlatButton(int index,BuildContext context) {
    setState(() {
      if(index==1){
        onFlatButtonHelp();
        _textColorEntire = GlobalButton.textColorAfter;
        _backColorEntire = GlobalButton.backColorAfter;
      }
      if(index==2){
        onFlatButtonHelp();
        _textColoNew = GlobalButton.textColorAfter;
        _backColoNew = GlobalButton.backColorAfter;
      }
      if(index==3){
        onFlatButtonHelp();
        _textColorNumber = GlobalButton.textColorAfter;
        _backColorNumber = GlobalButton.backColorAfter;
      }
      if(index==4){
        onFlatButtonHelp();
        _textColorSelect = GlobalButton.textColorAfter;
        _backColorSelect = GlobalButton.backColorAfter;
      }
    });
  }
  void onFlatButtonHelp() {
    setState(() {
      _textColorEntire = GlobalButton.textColorBefore;
      _textColoNew = GlobalButton.textColorBefore;
      _textColorNumber = GlobalButton.textColorBefore;
      _textColorSelect = GlobalButton.textColorBefore;
      _backColorEntire = GlobalButton.backColorBefore;
      _backColoNew = GlobalButton.backColorBefore;
      _backColorNumber = GlobalButton.backColorBefore;
      _backColorSelect = GlobalButton.backColorBefore;
    });
  }
}