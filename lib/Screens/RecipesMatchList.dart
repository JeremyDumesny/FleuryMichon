import 'dart:async';
import 'dart:math';

import 'package:fleury_michon/Models/Ingredients.dart';
import 'package:fleury_michon/Screens/OrderScreen.dart';
import 'package:fleury_michon/states/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:fleury_michon/Screens/RecipesMatchScreen.dart';

class RecipesTab extends StatefulWidget {
  @override
  _RecipesTabState createState() => _RecipesTabState();
}

class _RecipesTabState extends State<RecipesTab> with InputValidationMixin {
  bool _messagesSelected;
  bool _firstVistToFeed = false;
  final textController = TextEditingController();
  final formGlobalKey = GlobalKey < FormState > ();

  @override
  void initState() {
    super.initState();
    _messagesSelected = true;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(115.0),
          // color: Colors.indigo,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _messagesSelected = true;
                  });
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(115.0),
                      vertical: ScreenUtil().setHeight(20.0)),
                  child: Text(
                    "Recettes",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(50.0),
                        fontWeight: FontWeight.w500,
                        color: _messagesSelected
                            ? Theme.of(context).primaryColor
                            : Colors.blueGrey.shade200),
                  ),
                ),
              ),
              VerticalDivider(
                width: 0,
                thickness: 2,
                endIndent: ScreenUtil().setHeight(20.0),
                indent: ScreenUtil().setHeight(20.0),
                color: Colors.blueGrey.shade100,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _messagesSelected = false;
                    if (_firstVistToFeed == false) {
                      Future.delayed(
                          Duration(
                            seconds: 1,
                          ), () {
                        _firstVistToFeed = true;
                        setState(() {});
                      });
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(150.0),
                      vertical: ScreenUtil().setHeight(20.0)),
                  child: Text(
                    "Liste course",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(50.0),
                        fontWeight: FontWeight.w500,
                        color: _messagesSelected
                            ? Colors.blueGrey.shade200
                            : Theme.of(context).primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 2,
          color: Colors.blueGrey.shade50,
        ),
        // Based on which section does it selected .
        _messagesSelected
            ? Expanded(
                child: ListView(
                children: <Widget>[
                  SizedBox(height: ScreenUtil().setHeight(35.0)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(30.0)),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Recettes aimées",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(45.0),
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20.0)),
                  Provider.of<GlobalState>(context).likedRecipes.length != 0
                      ? ListBody(
                          children: List.generate(
                              Provider.of<GlobalState>(context, listen: false)
                                  .likedRecipes
                                  .length, (index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InChatScreen(
                                            recipe: Provider.of<GlobalState>(
                                                    context,
                                                    listen: false)
                                                .likedRecipes[index])));
                              },
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: ScreenUtil().setHeight(230.0),
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            ScreenUtil().setWidth(40.0)),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          height: ScreenUtil().setHeight(180),
                                          width: ScreenUtil().setHeight(180),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    Provider.of<GlobalState>(
                                                            context)
                                                        .likedRecipes[index]
                                                        .imageURL)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: ScreenUtil().setWidth(25.0),
                                        ),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              Provider.of<GlobalState>(context)
                                                  .likedRecipes[index]
                                                  .name,
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenUtil().setSp(50.0),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ))
                                      ],
                                    ),
                                  ),
                                  Divider(
                                      color: Theme.of(context).primaryColor,
                                      height: 1,
                                      indent: ScreenUtil().setWidth(300.0),
                                      endIndent: ScreenUtil().setWidth(20.0))
                                ],
                              ),
                            );
                          }),
                        )
                      : Text(
                          "Vous n'avez aimé aucune recette !",
                          textAlign: TextAlign.center,
                        )
                ],
              ))
            : _firstVistToFeed == false
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(
                          height: ScreenUtil().setHeight(30.0),
                        ),
                        Text(
                          "Chargement de la liste de course ...",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(50.0),
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  )
                : Provider.of<GlobalState>(context, listen: false)
                            .isBasketEmpty() ==
                        true
                    ? Expanded(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: ScreenUtil().setHeight(100.0),
                            ),
                            Image(
                                width: ScreenUtil().setWidth(600),
                                height: ScreenUtil().setHeight(400),
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/sorry.png')),
                            SizedBox(
                              height: ScreenUtil().setHeight(50.0),
                            ),
                            Text(
                              "Votre liste est vide",
                              style: TextStyle(
                                  wordSpacing: 1.5,
                                  fontSize: ScreenUtil().setSp(75.0),
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: ScreenUtil().setWidth(20.0),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(60.0)),
                              child: Text(
                                  "Nous n'avons pas pu retrouver votre liste de course. Réessayez en ajoutant des ingrédients à votre liste.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(40.0),
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey.shade600)),
                            )
                          ],
                        ),
                      )
                    : Expanded(
                        child: ListView(
                          children: <Widget>[
                            SizedBox(height: ScreenUtil().setHeight(35.0)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(30.0)),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Liste de course",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(45.0),
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor),
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(20.0)),
                            ListBody(
                                children: List.generate(
                              Provider.of<GlobalState>(context, listen: false)
                                  .listecourse
                                  .length,
                              (index) {
                                return Column(
                                  children: <Widget>[
                                    Container(
                                      height: ScreenUtil().setHeight(105.0),
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              ScreenUtil().setWidth(40.0)),
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
                                                Provider.of<GlobalState>(
                                                        context)
                                                    .listecourse[index]
                                                    .description,
                                                style: TextStyle(
                                                    fontSize: ScreenUtil()
                                                        .setSp(45.0),
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          )),
                                          SizedBox(
                                              width: ScreenUtil().setWidth(40)),
                                          GestureDetector(
                                            onTap: () {
                                                  Provider.of<GlobalState>(context, listen: false).validatedIngredient(Provider.of<GlobalState>(
                                                        context, listen: false)
                                                    .listecourse[index]);
                                            },
                                            child: Provider.of<GlobalState>(context, listen: false).isIngredientInValidBasket(Provider.of<GlobalState>(context, listen: false)
                                                    .listecourse[index]) ? Icon(Icons.remove_circle_outline) : Icon(Icons.shopping_basket_outlined),
                                          ),
                                          SizedBox(
                                              width: ScreenUtil().setWidth(40)),
                                          GestureDetector(
                                              onTap: () {
                                                Provider.of<GlobalState>(
                                                        context,
                                                        listen: false)
                                                    .removeFromBasket(Provider
                                                            .of<GlobalState>(
                                                                context,
                                                                listen: false)
                                                        .listecourse[index]);
                                                setState(() {});
                                              },
                                              child: Icon(Icons.delete))
                                        ],
                                      ),
                                    ),
                                    Divider(
                                        color: Theme.of(context).primaryColor,
                                        height: 1,
                                        indent: ScreenUtil().setWidth(50.0),
                                        endIndent: ScreenUtil().setWidth(20.0))
                                  ],
                                );
                              },
                            )),
                            SizedBox(
                              height: ScreenUtil().setWidth(20.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                              child: Row(
                                children: <Widget>[
                                            Expanded(
                                              child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                  Form(
                                                    key: formGlobalKey,
                                                    child: TextFormField(
                                                      controller: textController,
                                                      decoration: InputDecoration(
                                                        focusColor: Theme.of(context).primaryColor,
                                                        fillColor: Colors.white,
                                                        focusedBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(25.0),
                                                          borderSide: BorderSide(color: Theme.of(context).primaryColor),),
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(25.0),
                                                          borderSide: BorderSide(),
                                                        ),
                                                      hintText: "Ajouter un article"),
                                                      validator: (article) {
                                                        if (isArticleValid(article)) {
                                                          return null;
                                                        } else {
                                                          return "Entrez au moins 3 caractères.";
                                                        }
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            )),
                                            SizedBox(
                                                width: ScreenUtil().setWidth(40)),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor, shape: StadiumBorder()),
                                              onPressed: () {
                                              if (formGlobalKey.currentState.validate()) {
                                                formGlobalKey.currentState.save();
                                                Provider.of<GlobalState>(context, listen: false).addIngredient(new Ingredients(textController.text, "", false, false, false, false, true));
                                                formGlobalKey.currentState.reset();
                                                FocusScope.of(context).requestFocus(new FocusNode());
                                              }
                                            }, child: Text("Ajouter"))
                                          ],
                                        ),
                            ),
                            Provider.of<GlobalState>(context, listen: false).validatedListCourse.length != 0 ?
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderScreen()));
                                },
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                shape: StadiumBorder(),
                                color: Theme.of(context).primaryColor,
                                child: Text(
                                  "Passez commande",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ) : Padding(padding: EdgeInsets.all(10),
                            child: Text("Veuillez ajouter des articles à votre panier avant de commander.", style: TextStyle(fontSize: 17),),),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(30.0)),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Promotions actuelles",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(45.0),
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: <Widget>[
                                Container(
                                  height: ScreenUtil().setHeight(105.0),
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
                                            "Offre 24h, -50% sur le troisième produit Fleury Michon acheté",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenUtil().setSp(45.0),
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Divider(
                                    color: Theme.of(context).primaryColor,
                                    height: 1,
                                    indent: ScreenUtil().setWidth(50.0),
                                    endIndent: ScreenUtil().setWidth(20.0)),
                                SizedBox(height: 10),
                              ],
                            ),
                            Container(
                              height: ScreenUtil().setHeight(105.0),
                              margin: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(40.0)),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "1 paquet de jambon Fleury Michon acheté = le deuxième à moins 20%",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(45.0),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Divider(
                                color: Theme.of(context).primaryColor,
                                height: 1,
                                indent: ScreenUtil().setWidth(50.0),
                                endIndent: ScreenUtil().setWidth(20.0)),
                            SizedBox(height: 10),
                          ],
                        ),
                      )
      ],
    );
  }
}

mixin InputValidationMixin {
  bool isArticleValid(String article) => article.length >= 3;
}