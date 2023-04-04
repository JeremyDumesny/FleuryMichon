import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fleury_michon/Screens/RecipesMatchList.dart';
import 'package:fleury_michon/Screens/ProfileTab.dart';
import 'package:fleury_michon/Screens/TinderTab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  int index = 0;

  HomePage(this.index);
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabcontroller;
  int index = 0;
  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 3, vsync: this);
    _tabcontroller.addListener(() {
      setState(() {});
    });
    _tabcontroller.animateTo(widget.index);
    widget.index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: Theme(
            data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            child: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              elevation: 1,
              title: TabBar(
                  padding: EdgeInsets.only(bottom: 35),
                  indicatorColor: Colors.transparent,
                  controller: _tabcontroller,
                  tabs: [
                    SafeArea(
                      child: Container(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(20.0)),
                        child: Center(
                          child: Icon(
                            Icons.person_rounded,
                            color: _tabcontroller.index == 0
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: ScreenUtil().setSp(80.0),
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Container(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(20.0)),
                        child: Center(
                          child: Icon(
                            Icons.food_bank_rounded,
                            color: _tabcontroller.index == 1
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: ScreenUtil().setSp(100.0),
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Container(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(20.0)),
                        child: Center(
                          child: Icon(
                            Icons.list_rounded,
                            color: _tabcontroller.index == 2
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: ScreenUtil().setSp(80.0),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabcontroller,
          children: <Widget>[ProfileTab(), TinderTab(), RecipesTab()],
        ));
  }
}
