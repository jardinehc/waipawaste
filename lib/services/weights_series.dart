import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class WeightsSeries {
  final String date;
  final int weight;
  final charts.Color barcolor;

  WeightsSeries(
      {
    @required this.date,
    @required this.weight,
    @required this.barcolor
});

}