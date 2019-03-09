import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:event_bus/event_bus.dart';
import 'dart:io';

String urler = "http://zhexinjs.com";
String urls = "http://zhexinjs.com/app/index";
String urls_release = "http://zhexinjs.com/app/release";
String urls_area = "http://zhexinjs.com/app/area/select";
String urlsimages = "http://zhexinjs.com/app/img";
Map<String, String> cons = {};

Future getHomePageContent(String url,Map<String, String> con) async{
  try{
    Response response;
    response = await Dio().get(url,queryParameters: con);
    homePageContent=json.decode(response.toString());
    // print(homePageContent["offer"]);
    return response;
  }catch(e){
    return print('ERROR:======>${e}');
  }
}
Future getreleasePageContent(String url,Map<String, String> con) async{
  try{
    Response response;
    response = await Dio().get(url,queryParameters: con);
    releasePageContent=json.decode(response.toString());
    print(con);
    return response.data;
  }catch(e){
    return print('ERROR:======>${e}');
  }
}
Future getreleaseareaPageContent(String url,Map<String, String> con) async{
  try{
    Response response;
    response = await Dio().get(url,queryParameters: con);
    releasePageareaContent=json.decode(response.toString());
    // print(homePageContent["offer"]);
    print(con);
    return response.data;
  }catch(e){
    return print('ERROR:======>${e}');
  }
}
Future getMyPageContent(String url,Map<String, String> con) async{
  try{
    Response response;
    response = await Dio().get(url,queryParameters: con);
    myPageareaContent=json.decode(response.toString());
    print(con);
    return response.data;
  }catch(e){
    return print('ERROR:======>${e}');
  }
}
Future postreleasePageContent(String url,Map<String, String> con) async{
  try{
    Response response;
    response = await Dio().post(url,queryParameters: con);
    // releasePageContent=json.decode(response.toString());
    print(con);
    return response;
  }catch(e){
    return print('ERROR:======>${e}');
  }
}
Future postImageContent(con) async{
  try{
    print(con);
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("multipart/form-data");
    FormData formData = new FormData.from({
      "file": new UploadFileInfo(con, "upload1.jpg")
    });
    Response response;
    response = await dio.post("http://zhexinjs.com/app/img",data: formData);
    imageContents=json.decode(response.toString());
    return response.data;
  }catch(e){
    return print('ERROR:======>${e}');
  }
}
Future postyzm(url,con) async{
  try{
    Response response;
    print(con);
    response = await Dio().post(url,queryParameters: con);
    if (url=="http://zhexinjs.com/app/sends") {
      yzm = json.decode(response.toString())["code"];
      loginstatus = json.decode(response.toString())["status"];
    }
    if (url=="http://zhexinjs.com/app/login/account"||url=="http://zhexinjs.com/app/login/sms"||url=="http://zhexinjs.com/app/resetpwd"||
    url=="http://zhexinjs.com/app/login/wechat") {
      loginstatus = json.decode(response.toString())["status"];
      uid = json.decode(response.toString())["uid"];
    }
    return response;
  }catch(e){
    return print('ERROR:======>${e}');
  }
}

Map homePageContent;
Map releasePageContent;
Map releasePageareaContent;
Map myPageareaContent;
Map imageContents;

bool can = true;
String yzm = "";
var loginstatus;
var uid;

EventBus eventBus = new EventBus();
class MyEvent {
  Map<String, String> text;
  MyEvent(this.text);
}

String uidvalue="";