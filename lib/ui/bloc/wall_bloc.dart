import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_project/domain/app_constants.dart';
import 'package:wallpaper_project/domain/app_urls.dart';
import 'package:wallpaper_project/local/model/wallpaper_model.dart';
import 'package:wallpaper_project/ui/api_service/api_helper.dart';
import 'package:wallpaper_project/ui/bloc/wall_event.dart';
import 'package:wallpaper_project/ui/bloc/wall_state.dart';

class WallBloc extends Bloc<WallEvent, WallState>{
  ApiHelper apiHelper;
  WallBloc({required this.apiHelper}) : super(WallInitialState()){
    on<WallGetTrandingEvent>((event,emit)async{
      emit(WallLoadingState());
      try{
        var res = await apiHelper.getApi(url: AppUrls.trendingUrl);

        if(res!=null){
          emit(WallLoadedState(allWall: WallpaperDataModel.fromJson(res).photos ?? []));
        }
        else {
          emit(WallErrorState(errorMsg: "Something went wrong"));
        }
      }
      catch(e){
        emit(WallErrorState(errorMsg: e.toString()));
      }

    });

    on<WallSearchEvent>((event,emit)async{
      emit(WallLoadingState());
      try{
        var res =  await apiHelper.getApi(url: "${AppUrls.searchUrl}?query=${event.Query}&color=${event.mColor}&per_page=30");

        if(res != null){
          emit(WallLoadedState(allWall: WallpaperDataModel.fromJson(res).photos ?? []));
        }
        else {
          emit(WallErrorState(errorMsg: "Something went wrong"));
        }
      }
      catch(e){
        emit(WallErrorState(errorMsg: e.toString()));
      }

    });

  }
}