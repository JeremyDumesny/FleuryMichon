import 'package:fleury_michon/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:fleury_michon/Screens/QrCodeScan.dart';
import 'package:provider/provider.dart';
import 'package:fleury_michon/states/global_state.dart';
import 'package:flutter/animation.dart';

class TinderTab extends StatefulWidget {
  @override
  _TinderTabState createState() => _TinderTabState();
}

class _TinderTabState extends State<TinderTab>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    _cardController = CardController();
  }

  bool chng = true;
  bool atCenter = true;
  bool _triggerNotFound = false;
  bool _timeout = false;
  CardController _cardController;
  AnimationController animController;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Provider.of<GlobalState>(context, listen: false).hasScanned
        ? Stack(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 600),
                curve: Curves.fastLinearToSlowEaseIn,
                color: !atCenter
                    ? chng
                        ? Colors.pinkAccent.shade200
                        : Colors.tealAccent.shade200
                    : Colors.blue.shade50,
                child: Center(
                  child: _triggerNotFound
                      ? !_timeout
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(),
                                SizedBox(height: ScreenUtil().setHeight(30.0)),
                                Text(
                                  "Recherche de recettes à proximité ...",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(60.0),
                                      fontWeight: FontWeight.w200,
                                      color: Colors.grey.shade600),
                                )
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: ScreenUtil().setHeight(550.0)),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image(
                                      width: ScreenUtil().setWidth(400),
                                      height: ScreenUtil().setWidth(400),
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/persona.png')),
                                ),
                                SizedBox(height: ScreenUtil().setHeight(40.0)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil().setWidth(60.0)),
                                  child: Text(
                                      "Aucune nouvelle recette autour de vous ...",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          wordSpacing: 1.2,
                                          fontSize: ScreenUtil().setSp(55.0),
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey.shade600)),
                                )
                              ],
                            )
                      : Container(),
                ),
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  height: ScreenUtil().setWidth(220.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(1)));
                          Provider.of<GlobalState>(context, listen: false)
                              .resetIndex();
                          Provider.of<GlobalState>(context, listen: false)
                              .resetLikedList();
                          Provider.of<GlobalState>(context, listen: false).resetBasket();
                        },
                        child: Container(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(15.0)),
                          height: ScreenUtil().setHeight(110.0),
                          width: ScreenUtil().setHeight(110.0),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.0, 0.0),
                                    color: Colors.grey),
                                BoxShadow(
                                    offset: Offset(1.0, 1.0),
                                    color: Colors.grey,
                                    blurRadius: 5.0),
                                BoxShadow(
                                    offset: Offset(-1.0, -1.0),
                                    color: Colors.white,
                                    blurRadius: 10.0)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(60.0)),
                          child: ShaderMask(
                              child: Icon(Icons.refresh_rounded),
                              blendMode: BlendMode.srcATop,
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                    colors: [
                                      Colors.amber.shade700,
                                      Colors.amber.shade400
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    stops: [0.0, 1.0]).createShader(bounds);
                              }),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _cardController.triggerLeft();
                          Provider.of<GlobalState>(context, listen: false)
                              .incrementIndex();
                        },
                        child: Container(
                          padding: EdgeInsets.all(ScreenUtil().setSp(30.0)),
                          height: ScreenUtil().setHeight(110.0),
                          width: ScreenUtil().setHeight(110.0),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.0, 0.0),
                                    color: Colors.grey),
                                BoxShadow(
                                    offset: Offset(1.0, 1.0),
                                    color: Colors.grey,
                                    blurRadius: 5.0),
                                BoxShadow(
                                    offset: Offset(-1.0, -1.0),
                                    color: Colors.white,
                                    blurRadius: 10.0)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(60.0)),
                          child: ShaderMask(
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.red,
                              ),
                              blendMode: BlendMode.srcATop,
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                    colors: [Colors.red, Colors.orange],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    stops: [0.0, 1.0]).createShader(bounds);
                              }),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QRScanPage()));
                        },
                        child: Container(
                          height: ScreenUtil().setHeight(110.0),
                          width: ScreenUtil().setHeight(110.0),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.0, 0.0),
                                    color: Colors.grey),
                                BoxShadow(
                                    offset: Offset(1.0, 1.0),
                                    color: Colors.grey,
                                    blurRadius: 5.0),
                                BoxShadow(
                                    offset: Offset(-1.0, -1.0),
                                    color: Colors.white,
                                    blurRadius: 10.0)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(60.0)),
                          child: ShaderMask(
                              child: Icon(
                                Icons.qr_code_scanner,
                                size: ScreenUtil().setHeight(65.0),
                              ),
                              blendMode: BlendMode.srcATop,
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                    colors: [
                                      Colors.blue.shade600,
                                      Colors.blue.shade300
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    stops: [0.0, 1.0]).createShader(bounds);
                              }),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _cardController.triggerRight();
                          Provider.of<GlobalState>(context, listen: false)
                              .likeRecipe(Provider.of<GlobalState>(context,
                                      listen: false)
                                  .recipes[Provider.of<GlobalState>(context,
                                      listen: false)
                                  .index]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(ScreenUtil().setSp(30.0)),
                          height: ScreenUtil().setHeight(110.0),
                          width: ScreenUtil().setHeight(110.0),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.0, 0.0),
                                    color: Colors.grey),
                                BoxShadow(
                                    offset: Offset(1.0, 1.0),
                                    color: Colors.grey,
                                    blurRadius: 5.0),
                                BoxShadow(
                                    offset: Offset(-1.0, -1.0),
                                    color: Colors.white,
                                    blurRadius: 10.0)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(60.0)),
                          child: ShaderMask(
                              child: Icon(
                                Icons.favorite,
                                size: ScreenUtil().setHeight(65.0),
                              ),
                              blendMode: BlendMode.srcATop,
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                    colors: [
                                      Colors.tealAccent.shade700,
                                      Colors.tealAccent.shade200
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    stops: [0.0, 1.0]).createShader(bounds);
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: TinderSwapCard(
                    animDuration: 400,
                    orientation: AmassOrientation.TOP,
                    totalNum: Provider.of<GlobalState>(context, listen: false)
                        .recipes
                        .length,
                    stackNum: 3,
                    swipeEdge: 5.0,
                    maxWidth: MediaQuery.of(context).size.width - 10.0,
                    maxHeight: MediaQuery.of(context).size.height * 0.74,
                    minWidth: MediaQuery.of(context).size.width - 50.0,
                    minHeight: MediaQuery.of(context).size.height * 0.73,
                    cardBuilder: (context, index) {
                      return Provider.of<GlobalState>(context, listen: false)
                          .recipes[index];
                    },
                    cardController: _cardController,
                    swipeUpdateCallback:
                        (DragUpdateDetails details, Alignment align) {
                      /// Get swiping card's alignment
                      if (align.x < 0) {
                        //Card is LEFT swiping
                        print("Left align " + align.x.toString());
                        setState(() {
                          if (align.x < -1) atCenter = false;
                          chng = true;
                        });
                      } else if (align.x > 0) {
                        //Card is RIGHT swiping
                        print("right align " + align.x.toString());
                        setState(() {
                          if (align.x > 1) atCenter = false;
                          chng = false;
                        });
                      }
                    },
                    swipeCompleteCallback:
                        (CardSwipeOrientation orientation, int index) {
                      /// Get orientation & index of swiped card!
                      setState(() {
                        atCenter = true;
                        if (index ==
                            Provider.of<GlobalState>(context, listen: false)
                                    .recipes
                                    .length -
                                1) {
                          _triggerNotFound = true;
                          Future.delayed(Duration(seconds: 5), () {
                            _timeout = true;
                            setState(() {});
                          });
                        }
                      });

                      if (orientation == CardSwipeOrientation.RIGHT) {
                        Provider.of<GlobalState>(context, listen: false)
                            .likeRecipe(
                                Provider.of<GlobalState>(context, listen: false)
                                    .recipes[index]);
                      } else if (orientation == CardSwipeOrientation.LEFT) {
                        Provider.of<GlobalState>(context, listen: false)
                            .incrementIndex();
                      }
                    },
                  )),
            ],
          )
        : Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Scannez un produit Fleury Michon pour commencer.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  height: ScreenUtil().setWidth(350.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text("Scanner un code barre :"),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QRScanPage()));
                            },
                            child: Container(
                              height: ScreenUtil().setHeight(150.0),
                              width: ScreenUtil().setHeight(150.0),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0.0, 0.0),
                                        color: Colors.grey),
                                    BoxShadow(
                                        offset: Offset(1.0, 1.0),
                                        color: Colors.grey,
                                        blurRadius: 5.0),
                                    BoxShadow(
                                        offset: Offset(-1.0, -1.0),
                                        color: Colors.white,
                                        blurRadius: 10.0)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(60.0)),
                              child: ShaderMask(
                                  child: Icon(
                                    Icons.qr_code_scanner,
                                    size: ScreenUtil().setHeight(90.0),
                                  ),
                                  blendMode: BlendMode.srcATop,
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                        colors: [
                                          Colors.blue.shade600,
                                          Colors.blue.shade300
                                        ],
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        stops: [0.0, 1.0]).createShader(bounds);
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  double abs(double x) {
    if (x < 0) return x * -1;
    return x;
  }

  @override
  bool get wantKeepAlive => true;
}
