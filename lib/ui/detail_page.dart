import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{
    String selectedUrl;
    DetailPage({ required this.selectedUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("${selectedUrl}"))
        ),
        child: Stack(
          children: [
            Positioned(
              left: 30,
              bottom: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 45,),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Icon(Icons.info,color: Colors.white,),),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Icon(Icons.save_alt,color: Colors.white,),),
                  ),
                  SizedBox(width: 15,),
                   Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Icon(Icons.format_paint_outlined,color: Colors.white,),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),




    );

  }
}