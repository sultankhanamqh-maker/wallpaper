import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_project/ui/api_service/api_helper.dart';
import 'package:wallpaper_project/ui/bloc/wall_bloc.dart';
import 'package:wallpaper_project/ui/catagories_page.dart';
import 'package:wallpaper_project/ui/home_Page.dart';
import 'package:wallpaper_project/ui/splash_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => WallBloc(apiHelper: ApiHelper()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
