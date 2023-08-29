import 'package:cpay/models/modeltrade.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class Trading extends StatefulWidget {
  const Trading({super.key});

  @override
  State<Trading> createState() => _TradingState();
}

class _TradingState extends State<Trading> {
  late List<ChartSampleData> _chartData;
  late TrackballBehavior _trackballBehavior;
  @override
  void initState() {
    // TODO: implement initState
    _chartData = getChartData();
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCartesianChart(
          title: ChartTitle(text: "AAPL - 2016"),
          legend: const Legend(isVisible: true),
          trackballBehavior: _trackballBehavior,
          series: <CandleSeries>[
            CandleSeries<ChartSampleData, DateTime>(
              dataSource: _chartData,
              xValueMapper: (ChartSampleData sales, _) => sales.x,
              lowValueMapper: (ChartSampleData sales, _) => sales.low,
              highValueMapper: (ChartSampleData sales, _) => sales.high,
              openValueMapper: (ChartSampleData sales, _) => sales.open,
              closeValueMapper: (ChartSampleData sales, _) => sales.close,
            )
          ],
          primaryXAxis: DateTimeAxis(
              dateFormat: DateFormat.MMM(),
              majorGridLines: MajorGridLines(width: 0)),
          primaryYAxis: NumericAxis(
              minimum: 70,
              maximum: 130,
              interval: 10,
              numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
        ),
      ),
    );
  }
}
