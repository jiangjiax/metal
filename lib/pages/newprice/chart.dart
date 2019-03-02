import 'package:fcharts/fcharts.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

class SimpleLineChart extends StatelessWidget {
  // X value -> Y value
  static const myData = [
    ["2018/11", "25"],
    ["2018/12", "40"],
    ["2019/1", "50"],
    ["2019/2", "32"],
    ["2019/3", "40"],
  ];

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: 2,
      child: new LineChart(
        lines: [
          new Line<List<String>, String, String>(
            data: myData,
            xFn: (datum) => datum[0],
            yFn: (datum) => datum[1],
            stroke: new PaintOptions.stroke(
              color: Colors.blue,
              strokeWidth: 2.0,
            ),
            marker: new MarkerOptions(
              paint: new PaintOptions.fill(color: Colors.green),
            ),
          ),
          // new Line<List<String>, String, String>(
          //   data: myData,
          //   xFn: (datum) => datum[0],
          //   yFn: (datum) => datum[1],
          //   stroke: new PaintOptions.stroke(
          //     color: Colors.blue,
          //     strokeWidth: 2.0,
          //   ),
          //   marker: new MarkerOptions(
          //     paint: new PaintOptions.fill(color: Colors.blue),
          //   ),
          // ),
        ],
        chartPadding: new EdgeInsets.fromLTRB(30.0, 10.0, 10.0, 30.0),
      ),
    );
  }
}

//
class OrdinalComboBarLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  OrdinalComboBarLineChart(this.seriesList, {this.animate});

  factory OrdinalComboBarLineChart.withSampleData() {
    return new OrdinalComboBarLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.OrdinalComboChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.BarRendererConfig(groupingType: charts.BarGroupingType.grouped),
      customSeriesRenderers: [
        new charts.LineRendererConfig(
            customRendererId: 'customLine')
      ]
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {

    final mobileSalesData = [
      new OrdinalSales('2/28', 42100),
      new OrdinalSales('3/3', 36000),
      new OrdinalSales('3/5', 30080),
      new OrdinalSales('3/28', 40040),
      new OrdinalSales('3/29', 44200),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Mobile',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: mobileSalesData)
        ..setAttribute(charts.rendererIdKey, 'customLine'),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final double sales;

  OrdinalSales(this.year, this.sales);
}

/// Sample linear data type.
class LinearSales {
  final double year;
  final double sales;

  LinearSales(this.year, this.sales);
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

//
class HorizontalBarLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  HorizontalBarLabelChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory HorizontalBarLabelChart.withSampleData() {
    return new HorizontalBarLabelChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }


  // [BarLabelDecorator] will automatically position the label
  // inside the bar if the label will fit. If the label will not fit and the
  // area outside of the bar is larger than the bar, it will draw outside of the
  // bar. Labels can always display inside or outside using [LabelPosition].
  //
  // Text style for inside / outside can be controlled independently by setting
  // [insideLabelStyleSpec] and [outsideLabelStyleSpec].
  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      vertical: false,
      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      // Hide domain axis.
      domainAxis:
          new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2018/12', 5),
      new OrdinalSales('2019/1', 25),
      new OrdinalSales('2019/2', 100),
      new OrdinalSales('2019/3', 200),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Sales',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (OrdinalSales sales, _) =>
              '${sales.year}:  \¥${sales.sales.toString()}万')
    ];
  }
}

