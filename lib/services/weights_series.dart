import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

//this is used as part of the graphs in your info and waipa info

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