import 'package:bubble/bubble.dart';
import 'package:fleury_michon/Widgets/RecipeCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fleury_michon/Models/Ingredients.dart';
import 'package:provider/provider.dart';
import 'package:fleury_michon/states/global_state.dart';

class InChatScreen extends StatefulWidget {
  RecipeCard recipe;

  InChatScreen({@required this.recipe});
  @override
  _InChatScreenState createState() => _InChatScreenState();
}

class _InChatScreenState extends State<InChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          titleSpacing: 0.0,
          actions: <Widget>[
            ShaderMask(
                child:
                    IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                blendMode: BlendMode.srcATop,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.0, 1.0]).createShader(bounds);
                }),
          ],
          leading: ShaderMask(
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.0, 1.0]).createShader(bounds);
              }),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  widget.recipe.imageURL,
                  fit: BoxFit.cover,
                  height: ScreenUtil().setHeight(80.0),
                  width: ScreenUtil().setHeight(80.0),
                ),
              ),
              SizedBox(width: ScreenUtil().setWidth(20.0)),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(10.0), 0.0, 0.0, 0.0),
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Text(
                    widget.recipe.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(35.0),
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 12,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(20.0),
                    right: ScreenUtil().setWidth(20.0),
                  ),
                  child: ListView.builder(
                    itemCount: widget.recipe.ingredients.length,
                    reverse: false,
                    itemBuilder: (context, index) {
                      return widget.recipe.ingredients[index].isMe
                          ? Column(children: <Widget>[
                              Container(
                                height: widget.recipe.ingredients[index]
                                            .description.length >
                                        230
                                    ? ScreenUtil().setHeight(310)
                                    : widget.recipe.ingredients[index]
                                                .description.length >
                                            70
                                        ? ScreenUtil().setHeight(210.0)
                                        : widget.recipe.ingredients[index]
                                                    .description.length <
                                                20
                                            ? ScreenUtil().setHeight(80)
                                            : ScreenUtil().setHeight(110),
                                margin: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(40.0)),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          widget.recipe.ingredients[index]
                                              .description,
                                          style: TextStyle(
                                              color: widget
                                                      .recipe
                                                      .ingredients[index]
                                                      .received
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Colors.black,
                                              fontSize:
                                                  ScreenUtil().setSp(45.0),
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                              )
                            ])
                          : GestureDetector(
                              onTap: () {
                                if (widget
                                        .recipe.ingredients[index].isAddable &&
                                    Provider.of<GlobalState>(context,
                                                listen: false)
                                            .isIngredientInBasket(widget
                                                .recipe.ingredients[index]) ==
                                        false) {
                                  Provider.of<GlobalState>(context,
                                          listen: false)
                                      .addIngredient(
                                          widget.recipe.ingredients[index]);
                                  setState(() {});
                                } else if (widget
                                        .recipe.ingredients[index].isAddable &&
                                    Provider.of<GlobalState>(context,
                                                listen: false)
                                            .isIngredientInBasket(widget
                                                .recipe.ingredients[index]) ==
                                        true) {
                                  Provider.of<GlobalState>(context,
                                          listen: false)
                                      .removeFromBasket(
                                          widget.recipe.ingredients[index]);
                                  setState(() {});
                                }
                              },
                              child: Column(children: <Widget>[
                                Container(
                                  height: ScreenUtil().setHeight(105.0),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil().setWidth(40.0)),
                                  child: Row(
                                    children: <Widget>[
                                      widget.recipe.ingredients[index].isAddable
                                          ? Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Container(
                                                margin: EdgeInsets.all(3),
                                                height: 15,
                                                width: 15,
                                                decoration: BoxDecoration(
                                                    color: Provider.of<GlobalState>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .isIngredientInBasket(widget
                                                                        .recipe
                                                                        .ingredients[
                                                                    index]) ==
                                                            true
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.white,
                                                    shape: BoxShape.circle),
                                              ),
                                            )
                                          : Container(),
                                      widget.recipe.ingredients[index].isAddable
                                          ? SizedBox(
                                              width: 10,
                                              height: 15,
                                            )
                                          : SizedBox(),
                                      Expanded(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            widget.recipe.ingredients[index]
                                                .description,
                                            style: TextStyle(
                                                color: widget
                                                        .recipe
                                                        .ingredients[index]
                                                        .isAddable
                                                    ? Colors.black
                                                    : Theme.of(context)
                                                        .primaryColor,
                                                fontSize:
                                                    ScreenUtil().setSp(45.0),
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                                widget.recipe.ingredients[index].isAddable
                                    ? Divider(
                                        color: Theme.of(context).primaryColor,
                                        height: 1,
                                        indent: ScreenUtil().setWidth(50.0),
                                        endIndent: ScreenUtil().setWidth(20.0))
                                    : SizedBox()
                              ]));
                    },
                  ),
                )),
          ],
        ));
  }
}
