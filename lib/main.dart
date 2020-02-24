import 'package:flutter/material.dart';
import 'package:forms/pages/login_Page.dart';
import 'package:forms/pages/register_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/register':(BuildContext context )=> RegisterPage(),
        '/login':(BuildContext context)=>LoginPage()
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.cyan[400],
        accentColor: Colors.deepOrange[200],
        textTheme:TextTheme(
          headline1: TextStyle(fontSize: 72.0,fontWeight: FontWeight.bold),
          headline6:TextStyle(fontSize: 36.0,fontStyle: FontStyle.italic) ,
          bodyText1:TextStyle(fontSize: 18.0) 
        ),
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: RegisterPage(),
    );
  }
}
