import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_project/ui/home_Page.dart';

class SplashScreen extends StatelessWidget{
  
  
  @override
  Widget build(BuildContext context) {
    
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
    });
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100,),
            Text("Wallpaper",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),

          ],
        ),
      ),
    );
  }
}