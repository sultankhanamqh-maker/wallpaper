class SourceModel {
  String? landscape;
  String? large;
  String? large2x;
  String? medium;
  String? original;
  String? portrait;
  String? small;
  String? tiny;

  SourceModel({
    required this.landscape,
    required this.large,
    required this.large2x,
    required this.medium,
    required this.original,
    required this.portrait,
    required this.small,
    required this.tiny,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      landscape: json['landscape'],
      large: json['large'],
      large2x: json['large2x'],
      medium: json['medium'],
      original: json['original'],
      portrait: json['portrait'],
      small: json['small'],
      tiny: json['tiny'],
    );
  }
}

class WallpaperModel {
  String? alt;
  String? avg_color;
  int? height;
  int? id;
  bool liked;
  String? photographer;
  int? photographer_id;
  String? photographer_url;
  String? url;
  int? width;
  SourceModel? src;

  WallpaperModel({
    required this.id,
    required this.url,
    required this.height,
    required this.alt,
    required this.avg_color,
    required this.liked,
    required this.photographer,
    required this.photographer_id,
    required this.photographer_url,
    required this.src,
    required this.width,
  });

  factory WallpaperModel.formJson(Map<String, dynamic> json) {
    return WallpaperModel(
      id: json['id'],
      url: json['url'],
      height: json['height'],
      alt: json['alt'],
      avg_color: json['avg_color'],
      liked: json['liked'],
      photographer: json['photographer'],
      photographer_id: json['photographer_id'],
      photographer_url: json['photographer_url'],
      src: SourceModel.fromJson(json['src']),
      width: json['width'],
    );
  }
}

class WallpaperDataModel {
  String? next_page;
  int? page;
  int? per_page;
  int? total_results;
  List<WallpaperModel>? photos;

  WallpaperDataModel({
    required this.next_page,
    required this.page,
    required this.per_page,
    required this.photos,
    required this.total_results,
  });

  factory WallpaperDataModel.fromJson(Map<String, dynamic> json){
    List<WallpaperModel> mWallpaper = [];
    for(Map<String,dynamic> eachWall in json['photos']){
      mWallpaper.add(WallpaperModel.formJson(eachWall));
    }

    return WallpaperDataModel(next_page: json['next_page'],
        page: json['page'],
        per_page: json['per_page'],
        photos: mWallpaper,
        total_results: json['total_results']);
  }
}
