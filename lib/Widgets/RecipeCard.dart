import 'package:fleury_michon/Models/Ingredients.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class RecipeCard extends StatefulWidget {
  final String name;
  final String imageURL;
  final String difficulty;
  final String quantity;
  final int prepTime;
  final int cookTime;
  final List<Ingredients> ingredients;

  RecipeCard(this.name, this.imageURL, this.difficulty, this.quantity,
      this.prepTime, this.cookTime, this.ingredients);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade700,
              offset: Offset(0.0, 5.0),
              blurRadius: 20.0)
        ],
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade700,
                    offset: Offset(0.0, 5.0),
                    blurRadius: 15.0)
              ],
              borderRadius: BorderRadius.circular(100.0),
            ),
            height: MediaQuery.of(context).size.height * 0.74,
            width: MediaQuery.of(context).size.width - 10.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Image(
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                    image: AssetImage(widget.imageURL)),
              ),
            ),
          ),
          Positioned(
            bottom: ScreenUtil().setHeight(100.0),
            left: ScreenUtil().setWidth(40.0),
            width: ScreenUtil().setWidth(960),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.name.toString(),
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.black54,
                            offset: Offset(1.0, 2.0),
                            blurRadius: 10.0)
                      ],
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(70.0),
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(40.0),
                ),
                Text(
                  widget.difficulty.toString(),
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.black54,
                            offset: Offset(1.0, 2.0),
                            blurRadius: 10.0)
                      ],
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(70.0),
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(height: ScreenUtil().setHeight(10.0)),
                Text(
                  widget.quantity +
                      " - " +
                      (widget.prepTime + widget.cookTime).toString() +
                      " minutes",
                  style: TextStyle(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            color: Colors.black54,
                            offset: Offset(1.0, 2.0),
                            blurRadius: 10.0)
                      ],
                      fontSize: ScreenUtil().setSp(55.0),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 1.0,
            right: -1.0,
            child: Container(
              width: MediaQuery.of(context).size.width - 22.0,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black26],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1.0])),
            ),
          )
        ],
      ),
    );
  }
}
