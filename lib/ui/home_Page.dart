import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_project/ui/bloc/wall_bloc.dart';
import 'package:wallpaper_project/ui/bloc/wall_event.dart';
import 'package:wallpaper_project/ui/bloc/wall_state.dart';
import 'package:wallpaper_project/ui/catagories_page.dart';
import 'package:wallpaper_project/ui/detail_page.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<String> imageCategories = [
    'Nature',
    'People',
    'Technology',
    'Business',
    'Food',
    'Travel',
    'Animals',
    'Fashion',
    'Health',
    'Fitness',
    'Education',
    'Architecture',
    'Art',
    'Music',
    'Sports',
    'Transportation',
    'Lifestyle',
    'Backgrounds',
    'Wallpapers',
    'Abstract',
    'Cities',
    'Night',
    'Minimal',
    'Space',
    'Work',
    'Home',
    'Love',
    'Holidays',
  ];


  List<Map<String,dynamic>> mColors =[
    {
      "color" : Color(0xfffeb6b9),
      "colorCode" : "feb6b9"
    },
    {
      "color" : Color(0xff4164e1),
      "colorCode" : "4164e1"
    },
    {
      "color" : Color(0xff6042e0),
      "colorCode" : "6042e0"
    },
    {
      "color" : Color(0xff61bfc1),
      "colorCode" : "61bfc1"
    },
    {
      "color" : Color(0xff292929),
      "colorCode" : "292929"
    },
    {
      "color" : Color(0xfffe9a0b),
      "colorCode" : "fe9a0b"
    },
    {
      "color" : Color(0xffb647ec),
      "colorCode" : "b647ec"
    },

  ];

  @override
  void initState() {
    super.initState();
    context.read<WallBloc>().add(WallGetTrandingEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffecf3f5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Find Wallpaper",
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CatagoriesPage(query: searchController.text,)));
                    },icon: Icon(Icons.search),),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Best of the month",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                BlocBuilder<WallBloc , WallState>(
                  builder: (_,state) {
                    if(state is WallLoadedState){
                      return ListView(
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: 200,
                            child: state.allWall.isNotEmpty ?  ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.allWall.length,
                              itemBuilder: (context, index) {
                                var data = state.allWall[index];
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(selectedUrl: data.src!.portrait!,)));
                                  },
                                  child: data.src != null ? Container(
                                    width: 130,
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:  data.src!.portrait != null ? NetworkImage("${data.src!.portrait}") : AssetImage('') ,
                                      ),
                                    ),
                                  ) : Center(child: Text("No meta data found"),),
                                );
                              },
                            ) : Center(child: Text("No Walpaper has Found"),
                          )),
                          SizedBox(height: 8),
                          Text(
                            "The color tones",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            height: 45,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mColors.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CatagoriesPage(query: mColors[index]["colorCode"],)));
                                  },

                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    width: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: mColors[index]["color"],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Categories",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          GridView.builder(
                            itemCount: min(imageCategories.length,state.allWall.length),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 8/5
                            ),
                            itemBuilder: (context, index) {
                              var data = state.allWall[index];
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CatagoriesPage(query: imageCategories[index],)));
                                },
                                child: data.src != null ? Container(
                                  height: 40,
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: data.src!.portrait != null ? NetworkImage(data.src!.portrait!) : AssetImage(''),
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(child: Text(imageCategories[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                                ) : Center(child: Text("No Meta Data found"),),
                              );
                            },
                          ),
                        ],
                      );
                    }
                    if(state is WallErrorState){
                      return ScaffoldMessenger(child: Text(state.errorMsg));
                    }
                    if(state is WallLoadingState){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    return Container();
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
