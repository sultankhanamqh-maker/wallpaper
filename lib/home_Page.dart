import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_project/catagories_page.dart';
import 'package:wallpaper_project/detail_page.dart';

class HomePage extends StatelessWidget {
 static final List<Map<String, dynamic>> wallPapers = [
    {
      "bg_pic":
          "https://images.pexels.com/photos/27771819/pexels-photo-27771819.jpeg",
      "name": "Abstrack",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/27605479/pexels-photo-27605479.jpeg",
      "name": "Nature",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33752489/pexels-photo-33752489.jpeg",
      "name": "Sports",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/28469559/pexels-photo-28469559.jpeg",
      "name": "Animals",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33843460/pexels-photo-33843460.jpeg",
      "name": "Plants",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/16201000/pexels-photo-16201000.jpeg",
      "name": "Humans",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/16201000/pexels-photo-16201000.jpeg",
      "name": "Nature",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33481464/pexels-photo-33481464.jpeg",
      "name": "Plants",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33260934/pexels-photo-33260934.jpeg",
      "name": "Abstrack",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33201592/pexels-photo-33201592.jpeg",
      "name": "Scientific",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33425453/pexels-photo-33425453.jpeg",
      "name": "Abstrack",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33820106/pexels-photo-33820106.jpeg",
      "name": "Nature",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33691649/pexels-photo-33691649.jpeg",
      "name": "Sports",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33425825/pexels-photo-33425825.jpeg",
      "name": "Animals",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/31848016/pexels-photo-31848016.jpeg",
      "name": "Sports",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/32431779/pexels-photo-32431779.jpeg",
      "name": "Animals",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/27771819/pexels-photo-27771819.jpeg",
      "name": "Abstrack",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/27605479/pexels-photo-27605479.jpeg",
      "name": "Nature",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33752489/pexels-photo-33752489.jpeg",
      "name": "Sports",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/28469559/pexels-photo-28469559.jpeg",
      "name": "Animals",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33843460/pexels-photo-33843460.jpeg",
      "name": "Plants",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/16201000/pexels-photo-16201000.jpeg",
      "name": "Humans",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/16201000/pexels-photo-16201000.jpeg",
      "name": "Nature",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33481464/pexels-photo-33481464.jpeg",
      "name": "Plants",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33260934/pexels-photo-33260934.jpeg",
      "name": "Abstrack",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33201592/pexels-photo-33201592.jpeg",
      "name": "Scientific",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33425453/pexels-photo-33425453.jpeg",
      "name": "Abstrack",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33820106/pexels-photo-33820106.jpeg",
      "name": "Nature",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33691649/pexels-photo-33691649.jpeg",
      "name": "Sports",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/33425825/pexels-photo-33425825.jpeg",
      "name": "Animals",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/31848016/pexels-photo-31848016.jpeg",
      "name": "Sports",
    },
    {
      "bg_pic":
      "https://images.pexels.com/photos/32431779/pexels-photo-32431779.jpeg",
      "name": "Animals",
    },
  ];

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
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Find Wallpaper",
                    hintStyle: TextStyle(color: Colors.grey),
                    suffix: Icon(Icons.search,color: Colors.grey,),

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
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: wallPapers.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(selectedUrl: wallPapers[index]["bg_pic"],)));
                        },
                        child: Container(
                          width: 130,
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("${wallPapers[index]["bg_pic"]}"),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
                    itemCount: wallPapers.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(3),
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
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
                  itemCount: wallPapers.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 8/5
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CatagoriesPage(textHead: wallPapers[index]["name"],)));
                      },
                      child: Container(
                         height: 40,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(wallPapers[index]["bg_pic"]),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(child: Text(wallPapers[index]["name"],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getApi(){

  }
}
