import 'package:fleury_michon/Screens/SuccessOrderScreen.dart';
import 'package:fleury_michon/states/global_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedDriveOption = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Commande au drive"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SafeArea(
          child: Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                Card(
                  shape: selectedDriveOption == 1
                      ? RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0),
                          borderRadius: BorderRadius.circular(4.0))
                      : RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (selectedDriveOption == 1) {
                          selectedDriveOption = -1;
                        } else {
                          selectedDriveOption = 1;
                        }
                      });
                    },
                    splashFactory: NoSplash.splashFactory,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      child: Container(
                          child: Image(
                        image: AssetImage("assets/images/carrefour_drive.png"),
                      )),
                      width: ScreenUtil().setWidth(500),
                      height: ScreenUtil().setWidth(500),
                    ),
                  ),
                ),
                Card(
                  shape: selectedDriveOption == 2
                      ? RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0),
                          borderRadius: BorderRadius.circular(4.0))
                      : RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (selectedDriveOption == 2) {
                          selectedDriveOption = -1;
                        } else {
                          selectedDriveOption = 2;
                        }
                      });
                    },
                    splashFactory: NoSplash.splashFactory,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      child: Container(
                          child: Image(
                        image: AssetImage("assets/images/monoprix_drive.jpg"),
                      )),
                      width: ScreenUtil().setWidth(500),
                      height: ScreenUtil().setWidth(500),
                    ),
                  ),
                ),
                Card(
                  shape: selectedDriveOption == 3
                      ? RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0),
                          borderRadius: BorderRadius.circular(4.0))
                      : RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (selectedDriveOption == 3) {
                          selectedDriveOption = -1;
                        } else {
                          selectedDriveOption = 3;
                        }
                      });
                    },
                    splashFactory: NoSplash.splashFactory,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      child: Container(
                          child: Image(
                        image: AssetImage("assets/images/leclerc_drive.png"),
                      )),
                      width: ScreenUtil().setWidth(500),
                      height: ScreenUtil().setWidth(500),
                    ),
                  ),
                ),
                Card(
                  shape: selectedDriveOption == 4
                      ? RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0),
                          borderRadius: BorderRadius.circular(4.0))
                      : RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (selectedDriveOption == 4) {
                          selectedDriveOption = -1;
                        } else {
                          selectedDriveOption = 4;
                        }
                      });
                    },
                    splashFactory: NoSplash.splashFactory,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      child: Container(
                          child: Image(
                        image: AssetImage("assets/images/auchan_drive.jpg"),
                      )),
                      width: ScreenUtil().setWidth(500),
                      height: ScreenUtil().setWidth(500),
                    ),
                  ),
                ),
                Center(
                  child: selectedDriveOption == -1
                      ? Text(
                          "Veuillez selectionner un drive !",
                          style: TextStyle(fontSize: 20),
                        )
                      : Text(
                          "Vous avez choisi le drive " +
                              (selectedDriveOption == 1
                                  ? "Carrefour."
                                  : selectedDriveOption == 2
                                      ? "Monoprix."
                                      : selectedDriveOption == 3
                                          ? "Leclerc."
                                          : "Auchan."),
                          style: TextStyle(fontSize: 20),
                        ),
                ),
                Center(
                  child: Text(
                    "Votre panier contient " +
                        Provider.of<GlobalState>(context, listen: false)
                            .validatedListCourse
                            .length
                            .toString() +
                        " articles.",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 45),
                selectedDriveOption != -1
                    ? RaisedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuccessOrderScreen())),
                        shape: StadiumBorder(),
                        color: Theme.of(context).primaryColor,
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Text(
                          "Commander",
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ));
  }
}
