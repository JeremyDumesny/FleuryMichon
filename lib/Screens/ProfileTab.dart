import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade100,
        ),
        ClipPath(
          clipBehavior: Clip.antiAlias,
          clipper: MyClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.725,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 10.0)
            ]),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: ScreenUtil().setHeight(50.0)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(500.0),
                          child: Image(
                              fit: BoxFit.cover,
                              height: ScreenUtil().setHeight(350.0),
                              width: ScreenUtil().setWidth(430.0),
                              image: AssetImage('assets/images/persona.png')),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(10.0)),
                        Text(
                          "Sylvie, 22",
                          style: TextStyle(
                              letterSpacing: 1.1,
                              fontSize: ScreenUtil().setSp(70),
                              fontWeight: FontWeight.w400),
                        ),
                        Expanded(
                            child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: ScreenUtil().setWidth(165.0),
                                    height: ScreenUtil().setHeight(140.0),
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey.shade50,
                                        borderRadius:
                                            BorderRadius.circular(100.0)),
                                    child: Icon(
                                      Icons.settings,
                                      size: ScreenUtil().setSp(100),
                                      color: Colors.blueGrey.shade200,
                                    ),
                                  ),
                                  SizedBox(
                                      height: ScreenUtil().setHeight(10.0)),
                                  Text(
                                    "PARAMETRES",
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade200,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                                child: Stack(
                              children: <Widget>[
                                Container(
                                  color: Colors.white,
                                ),
                                Positioned(
                                  right: 1.0,
                                  bottom: 0.0,
                                  left: 1.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        width: ScreenUtil().setHeight(160),
                                        height: ScreenUtil().setHeight(160),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Theme.of(context).accentColor,
                                                  Theme.of(context)
                                                      .secondaryHeaderColor,
                                                  Theme.of(context).primaryColor
                                                ],
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomRight,
                                                stops: [0.0, 0.35, 1.0]),
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(150.0)),
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: ScreenUtil().setSp(125.0),
                                        ),
                                      ),
                                      SizedBox(
                                          height: ScreenUtil().setHeight(10.0)),
                                      Text(
                                        "AJOUTER PHOTO",
                                        style: TextStyle(
                                            color: Colors.blueGrey.shade200,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: ScreenUtil().setWidth(80.0),
                                  bottom: ScreenUtil().setWidth(62.0),
                                  child: Container(
                                    width: ScreenUtil().setHeight(50),
                                    height: ScreenUtil().setHeight(50),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(2.0, 3.0),
                                            blurRadius: 5.0,
                                          )
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: ScreenUtil().setWidth(165.0),
                                    height: ScreenUtil().setHeight(140.0),
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey.shade50,
                                        borderRadius:
                                            BorderRadius.circular(100.0)),
                                    child: Icon(
                                      Icons.edit,
                                      size: ScreenUtil().setSp(100),
                                      color: Colors.blueGrey.shade200,
                                    ),
                                  ),
                                  SizedBox(
                                      height: ScreenUtil().setHeight(10.0)),
                                  Text(
                                    "MODIFIER",
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade200,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 3, child: Container())
              ],
            ),
          ),
        ),
      ],
    );
  }
}

final Shader linearGradient = LinearGradient(
        colors: [Colors.amber.shade800, Colors.amber.shade600],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.0, 1.0])
    .createShader(Rect.fromLTWH(
        0.0, 0.0, ScreenUtil().setWidth(30), ScreenUtil().setHeight(20)));

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();
    p.lineTo(0, size.height - ScreenUtil().setHeight(200));
    Offset controlPoint = Offset(size.width / 2, size.height);
    p.quadraticBezierTo(controlPoint.dx, controlPoint.dy, size.width,
        size.height - ScreenUtil().setHeight(200));
    //p.lineTo(size.width,size.height - ScreenUtil().setHeight(200) );
    p.lineTo(size.width, 0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
