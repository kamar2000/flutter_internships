import 'package:charts_flutter/flutter.dart'as charts;
class BarChartModel{
  String date;
  int financial;
  final charts.Color color;
  BarChartModel({
    required this.date,
    required this.financial,
    required this.color});
}