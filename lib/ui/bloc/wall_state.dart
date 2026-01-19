import 'package:wallpaper_project/local/model/wallpaper_model.dart';

abstract class WallState {

}

class WallInitialState extends WallState{}

class WallLoadingState extends WallState{}

class WallLoadedState extends WallState{
  List<WallpaperModel> allWall;
  WallLoadedState({required this.allWall});
}
class WallErrorState extends WallState{
  String errorMsg;
  WallErrorState({required this.errorMsg});
}