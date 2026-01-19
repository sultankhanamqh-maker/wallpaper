import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_project/ui/bloc/wall_bloc.dart';
import 'package:wallpaper_project/ui/bloc/wall_event.dart';
import 'package:wallpaper_project/ui/bloc/wall_state.dart';
import 'package:wallpaper_project/ui/detail_page.dart';
import 'package:wallpaper_project/ui/home_Page.dart';



class CatagoriesPage extends StatefulWidget {
  String query;
  String mColor;
  CatagoriesPage({required this.query,this.mColor= ""});

  @override
  State<CatagoriesPage> createState() => _CatagoriesPageState();
}

class _CatagoriesPageState extends State<CatagoriesPage> {

  @override
  void initState() {
    super.initState();
    context.read<WallBloc>().add(WallSearchEvent(Query: widget.query.isNotEmpty ?  widget.query : "nature" ,mColor: widget.mColor.isNotEmpty ? widget.mColor : ""));
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffecf3f5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<WallBloc,WallState>(
            builder: (_,state) {
              if(state is WallLoadedState){
                return ListView(
                  children: [
                    SizedBox(height: 15),
                    Text(
                      widget.mColor.isEmpty ?widget.query : "Nature" ,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "36 wallpaper available",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 15),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.allWall.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 9 / 16,
                      ),
                      itemBuilder: (context, index) {
                        var data = state.allWall[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => DetailPage(
                                  selectedUrl:
                                  data.src!.portrait!,
                                ),
                              ),
                            );
                          },
                          child:data.src != null ? Container(
                            height: 200,
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: data.src!.portrait != null ?NetworkImage(
                                  data.src!.portrait!,
                                ) : AssetImage(""),
                              ),
                            ),
                          ) : Center(child: Text("No meta data found"),) ,
                        );
                      },
                    ),
                  ],
                );
              }
              return Container();
            }
          ),
        ),
      ),
    );
  }
}
