import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_project/catagories_page.dart';
import 'package:wallpaper_project/home_Page.dart';
import 'package:wallpaper_project/splash_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }

}

