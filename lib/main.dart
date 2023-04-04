import 'package:flutter/material.dart';
import 'package:fleury_michon/Screens/SplashScreen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fleury_michon/states/global_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalState(context)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fleury Cuisto',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(34, 131, 54, 1.0),
            secondaryHeaderColor: Color.fromRGBO(34, 131, 54, 1.0),
            accentColor: Color.fromRGBO(34, 131, 54, 1.0)),
        home: SplashScreen(),
      ),
    );
  }
}
