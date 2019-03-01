import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';

class SwiperPage extends StatefulWidget {
  @override
  SwiperPageState createState() {
    return SwiperPageState();
  }
}

class SwiperPageState extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomClipperTest(),
      child: Container(
//        color:Colors.green,
        height: 200.0,
        child: SwiperPages(),
      ),
    );
  }
}

class BottomClipperTest extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);//左上角
    path.lineTo(0, size.height);//左下角
    var firstControlPoint =Offset(size.width/2,size.height-20);
    var firstEndPoint = Offset(size.width,size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, size.height-40);
    path.lineTo(size.width, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SwiperPages extends StatefulWidget {
  @override
  SwiperPagesState createState() {
    return SwiperPagesState();
  }
}

class SwiperPagesState extends State<SwiperPages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: new Swiper(
        itemCount: GlobalSwiper.images.length,
        // viewportFraction: 0.8,
        // scale: 0.9,
        autoplay: true,
        loop:true,
        duration: 1000,
        autoplayDelay: 10000,
        // control: new SwiperControl(),
        onTap: (index) => print('点击了第$index个'),
        pagination: new SwiperPagination(
            margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
            builder: new DotSwiperPaginationBuilder(
                color: Colors.white30,
                activeColor: Colors.white,
                size: 10.0,
                activeSize: 8.0)
        ),
        itemBuilder: (BuildContext context, int index) {
          return new Image.asset(
            GlobalSwiper.images[index],
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }
}