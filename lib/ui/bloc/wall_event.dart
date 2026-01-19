abstract class WallEvent {}

class WallGetTrandingEvent extends WallEvent{}

class WallSearchEvent extends WallEvent{
  String Query;
  String mColor;
  WallSearchEvent({required this.Query,this.mColor = ""});
}