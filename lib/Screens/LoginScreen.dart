import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fleury_michon/Screens/PhoneNumber.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).accentColor,
                    Theme.of(context).secondaryHeaderColor,
                    Theme.of(context).primaryColor
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.35, 1.0])),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          width: ScreenUtil().setWidth(1000),
                          image: AssetImage("assets/images/fleury_michon.png")),
                      SizedBox(width: ScreenUtil().setWidth(10.0)),
                    ],
                  ))),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(75.0)),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'En cliquant sur "Se connecter", vous acceptez nos termes d\'utilisation.\n Découvrez comment nous utilisons vos données dans notre Politique de confidentialité et de Cookies.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(50.0)),
                        Container(
                          width: double.infinity,
                          height: ScreenUtil().setHeight(105.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0)),
                            color: Colors.white,
                            elevation: 0.0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PhoneNumberScreen()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Se connecter avec un numéro de téléphone",
                                  style: TextStyle(
                                      color: Colors.black, wordSpacing: 1.2),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(70.0)),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
