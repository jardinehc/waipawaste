import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class History extends StatelessWidget {

  final List<charts.Series> seriesList;
  History(this.seriesList);

  factory History.withSampleData() {
    return new History(
      _createit(),
      // Disable animations for image tests.
     // animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<Weights, int>> _createit() {
    final data = [
      new Weights(2, 100),
      new Weights(3, 75),
    ];

    return [
      new charts.Series<Weights, int>(
        id: 'Weights',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Weights sales, _) => sales.weeksAgo,
        measureFn: (Weights sales, _) => sales.weight,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class Weights {
  final int weeksAgo;
  final int weight;

  Weights(this.weeksAgo, this.weight);
}

