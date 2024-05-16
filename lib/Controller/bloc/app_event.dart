part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class GetportfoliEvent extends AppEvent {}

class GetopenordersEvent extends AppEvent {}

class Movetopageevent extends AppEvent {
  int pagenum;

  Movetopageevent({required this.pagenum});
}

class FilterEvent extends AppEvent {
  String? symbol;
  String? price;
  DateTime? startdate;
  DateTime? enddate;

  bool? clearfilter;

  FilterEvent(
      {this.symbol,
      this.price,
      this.startdate,
      this.enddate,
      this.clearfilter});
}
