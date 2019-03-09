import 'package:flutter/material.dart';
import 'package:metal/data/global_home.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/add/add.dart';

int iniindex;
bool bos=true;
String title;

class Province extends StatefulWidget {
  final int iniindex;
  Province({Key key, this.iniindex}) : super(key: key);

  _ProvinceState createState() => _ProvinceState();
}

class _ProvinceState extends State<Province> {
  @override
  void initState() { 
    super.initState();
    iniindex = this.widget.iniindex;
    bos=true;
    title="请选择城市";
    // print(releasePageareaContent);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF90CAF9),
          elevation: 0.0,
          title: Text(title),
        ),
        body:
        bos?
        new FutureBuilder(
          future: getreleaseareaPageContent(urls_area,ids),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: releasePageContent["province"].length,
                separatorBuilder: (BuildContext context, int index) => Divider(),
                padding: EdgeInsets.all(0),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(releasePageContent["province"][index]["name"],style: TextStyle(fontSize: 15.0),),
                    onTap: (){
                      setState(() {
                        local = releasePageContent["province"][index]["name"];
                        localid = releasePageContent["province"][index]["id"];
                        bos = false;
                        title = releasePageContent["province"][index]["name"];
                        ids = {"id":releasePageContent["province"][index]["id"]};
                        if (releasePageContent["province"][index]["id"]=="900000") {
                          localhigh = local;
                          Navigator.of(context).pop();
                          eventBus.fire(cons);
                        }
                      });
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }

            return new Center(
              child:CircularProgressIndicator()
            );
          }
        )
        :City()
      )
    );
  }
}

Map<String,String> ids;
bool boss=true;

class City extends StatefulWidget {
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  @override
  void initState() { 
    super.initState();
    boss=true;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:boss?new FutureBuilder(
        future: getreleaseareaPageContent(urls_area,ids),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: releasePageareaContent["area"].length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              padding: EdgeInsets.all(0),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(releasePageareaContent["area"][index]["name"],style: TextStyle(fontSize: 15.0),),
                  onTap: (){
                    setState(() {
                      localcity = releasePageareaContent["area"][index]["name"];
                      localcityid = releasePageareaContent["area"][index]["id"];
                      title = localcity;
                      ids = {"id":releasePageareaContent["area"][index]["id"]};
                      print(ids);
                      boss = false;
                    });
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          }

          return new Center(
            child:CircularProgressIndicator()
          );
        }
      ):Area()
    );
  }
}

class Area extends StatefulWidget {
  _AreaState createState() => _AreaState();
}

class _AreaState extends State<Area> {
  @override
  void initState() { 
    super.initState();
    boss=true;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:new FutureBuilder(
        future: getreleaseareaPageContent(urls_area,ids),
        builder: (context, snapshot) {
          print(releasePageareaContent["area"].length);
          // if (releasePageareaContent["area"].length==1) {
          //   localhigh = local + " " + localcity;
          //   Navigator.of(context).pop();
          //   print(localhigh);
          //   eventBus.fire(cons);
          // }else{
            
          // }
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: releasePageareaContent["area"].length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              padding: EdgeInsets.all(0),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(releasePageareaContent["area"][index]["name"],style: TextStyle(fontSize: 15.0),),
                  onTap: (){
                    setState(() {
                      localarea = releasePageareaContent["area"][index]["name"];
                      localareaid = releasePageareaContent["area"][index]["id"];
                      title = localarea;
                      localhigh = local + " " + localcity + " " + localarea;
                      Navigator.of(context).pop();
                      eventBus.fire(cons);
                    });
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          }

          return new Center(
            child:CircularProgressIndicator()
          );
        }
      )
    );
  }
}