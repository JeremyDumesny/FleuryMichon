import 'package:fleury_michon/states/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class SuccessOrderScreen extends StatefulWidget {
  SuccessOrderScreen({Key key}) : super(key: key);

  @override
  _SuccessOrderScreenState createState() => _SuccessOrderScreenState();
}

class _SuccessOrderScreenState extends State<SuccessOrderScreen> {
  bool orderLoading = false;

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (orderLoading == false) {
        Future.delayed(Duration(seconds: 2), () {
          orderLoading = true;
          setState(() {
            Provider.of<GlobalState>(context, listen: false).substractValidatedToBaseList();
            Provider.of<GlobalState>(context, listen: false).resetValidatedBasket();
          });
        });
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Validation commande"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: orderLoading == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(
                      height: ScreenUtil().setHeight(30.0),
                    ),
                    Text(
                      "Commande en cours de validation ...",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(50.0),
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                )
              : Column(
                  children: <Widget>[
                    Image(
                        width: ScreenUtil().setWidth(600),
                        height: ScreenUtil().setHeight(400),
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/merci.png')),
                    Center(
                        child: Text(
                            "Commande validée. Merci de votre confiance.",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center)),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Retour à l'accueil",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      shape: StadiumBorder(),
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
        ),
      ),
    );
  }
}
