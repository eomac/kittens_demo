import 'package:flutter/material.dart';

import 'components/screens/myHomePage.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        backgroundColor: kBackgroundColor,
        buttonTheme: ButtonThemeData(
          buttonColor: KButtonColor,
          textTheme: ButtonTextTheme.primary),
      ),
      home: MyHomePage(title: 'Adopt me!'),
    );
  }
}
