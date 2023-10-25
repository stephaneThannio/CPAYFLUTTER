import 'dart:convert';

import 'package:cpay/models/modeltradenet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
//import 'package:syncfusion_flutter_sliders/sliders.dart';

class Trading extends StatefulWidget {
  const Trading({super.key});

  @override
  State<Trading> createState() => _TradingState();
}

class _TradingState extends State<Trading> {
  Map<String, dynamic> titlelist = {};
  bool invest = false;
  List<Modeltradenet> markinvest = [];

  List<Modeltradenet> chartDatatrade = [];
  List<Modeltradenet> chartDatatrade2 = [];
  CrosshairBehavior crosshairBehavior =
      CrosshairBehavior(enable: true, activationMode: ActivationMode.singleTap);
  DateTime lastDataPointX = DateTime.now();
  double lastDataPointY = 0.0;
  bool loading = false;
  late TrackballBehavior _trackballBehavior;

  gettrade() async {
    try {
      chartDatatrade2.clear();
      var requeset = await get(Uri.parse(
          "https://www.alphavantage.co/query?function=FX_INTRADAY&from_symbol=EUR&to_symbol=USD&interval=5min&apikey=demo"));
      if (requeset.statusCode == 200) {
        if (mounted) {
          setState(() {
            var data = jsonDecode(requeset.body);
            chartDatatrade = listaftertransform(data["Time Series FX (5min)"]);
            chartDatatrade2.add(chartDatatrade[0]);
            titlelist = data["Meta Data"];

            lastDataPointX = chartDatatrade.first.date;
            lastDataPointY = chartDatatrade.first.close;
          });
        }
        Future.delayed(const Duration(minutes: 5), () {
          gettrade();
        });
      } else {
        return null;
      }
    } catch (error) {
      return error;
    }
  }

  miser() {
    markinvest.add(chartDatatrade[1]);
    setState(() {
      invest = !invest;
    });
    print("miser: $invest");
  }

  @override
  void initState() {
    // _chartData = getChartData();
    gettrade();

    //_chartDatatrade = listaftertransform(Api.getapitrading());
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          // loading
          //     ? const Loading(spincouleur: Colors.red, containcouleur: Colors.white)
          //     :
          Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.sp,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF6334A9).withOpacity(0.8),
                    borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 60.sp,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            '\$50 000',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.red,
                              fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'demo balance',
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        width: 1,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Finances',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SfCartesianChart(
                trackballBehavior: _trackballBehavior,
                crosshairBehavior: CrosshairBehavior(
                    enable: true, activationMode: ActivationMode.singleTap),

                zoomPanBehavior: ZoomPanBehavior(
                    //maximumZoomLevel: 0.1,
                    enablePanning: true,
                    enablePinching: true,
                    zoomMode: ZoomMode.x),
                title: ChartTitle(
                    text:
                        "${titlelist["2. From Symbol"]}/${titlelist["3. To Symbol"]}"),
                //legend: const Legend(isVisible: true),
                //trackballBehavior: _trackballBehavior,
                series: <ChartSeries>[
                  AreaSeries<Modeltradenet, DateTime>(
                    borderColor: const Color(0xFF6334A9),
                    borderWidth: 1,
                    color: const Color(0xFF6334A9).withOpacity(0.2),
                    dataSource: chartDatatrade,
                    xValueMapper: (Modeltradenet sales, _) => sales.date,
                    yValueMapper: (Modeltradenet sales, _) => sales.close,

                    // lowValueMapper: (Modeltradenet sales, _) => sales.low,
                    // highValueMapper: (Modeltradenet sales, _) => sales.high,
                    // openValueMapper: (Modeltradenet sales, _) => sales.open,
                    // closeValueMapper: (Modeltradenet sales, _) => sales.close,
                  ),
                  SplineSeries<Modeltradenet, DateTime>(
                    dataSource: chartDatatrade2,
                    color: const Color(0xFF6334A9),
                    width: 2,
                    xValueMapper: (Modeltradenet sales, _) => sales.date,
                    yValueMapper: (Modeltradenet sales, _) => sales.close,
                    markerSettings: MarkerSettings(
                      isVisible: true, // Afficher les marqueurs
                      shape: DataMarkerType
                          .horizontalLine, // Forme du marqueur (circle, square, etc.)
                      color: const Color(0xFF6334A9)
                          .withOpacity(0.5), // Couleur des marqueurs
                      width: 1000, // Largeur des marqueurs
                    ),
                    dataLabelSettings: const DataLabelSettings(
                      offset: Offset(-50, 25),
                      useSeriesColor: true,
                      borderWidth: 2,
                      borderColor: Color(0xFF6334A9),
                      // connectorLineSettings: ConnectorLineSettings(
                      //     width: 2, color: Colors.red, type: ConnectorType.curve),
                      isVisible: true,
                      alignment: ChartAlignment.center,
                      labelAlignment: ChartDataLabelAlignment.bottom,
                    ),
                  ),
                  SplineSeries<Modeltradenet, DateTime>(
                    dataSource: chartDatatrade2,
                    color: const Color(0xFF6334A9),
                    width: 2,
                    xValueMapper: (Modeltradenet sales, _) => sales.date,
                    yValueMapper: (Modeltradenet sales, _) => sales.close,
                    markerSettings: MarkerSettings(
                      isVisible: true, // Afficher les marqueurs
                      shape: DataMarkerType
                          .circle, // Forme du marqueur (circle, square, etc.)
                      color: Colors.white
                          .withOpacity(0.5), // Couleur des marqueurs
                      width: 4, // Largeur des marqueurs
                    ),
                  ),
                  invest
                      ? SplineSeries<Modeltradenet, DateTime>(
                          dataSource: markinvest,
                          color: Colors.red,
                          width: 2,
                          xValueMapper: (Modeltradenet sales, _) => sales.date,
                          yValueMapper: (Modeltradenet sales, _) => sales.close,
                          markerSettings: MarkerSettings(
                            isVisible: true, // Afficher les marqueurs
                            shape: DataMarkerType
                                .horizontalLine, // Forme du marqueur (circle, square, etc.)
                            color: Colors.red
                                .withOpacity(0.5), // Couleur des marqueurs
                            width: 1000, // Largeur des marqueurs
                          ),
                          dataLabelSettings: const DataLabelSettings(
                            offset: Offset(-70, 25),
                            useSeriesColor: true,
                            borderWidth: 2,
                            borderColor: Colors.red,
                            // connectorLineSettings: ConnectorLineSettings(
                            //     width: 2, color: Colors.red, type: ConnectorType.curve),
                            isVisible: true,
                            alignment: ChartAlignment.center,
                            labelAlignment: ChartDataLabelAlignment.bottom,
                          ),
                        )
                      : SplineSeries<Modeltradenet, DateTime>(
                          dataSource: chartDatatrade2,
                          color: const Color(0xFF6334A9),
                          width: 2,
                          xValueMapper: (Modeltradenet sales, _) => sales.date,
                          yValueMapper: (Modeltradenet sales, _) => sales.close,
                        ),
                  invest
                      ? SplineSeries<Modeltradenet, DateTime>(
                          dataSource: markinvest,
                          color: Colors.red,
                          width: 2,
                          xValueMapper: (Modeltradenet sales, _) => sales.date,
                          yValueMapper: (Modeltradenet sales, _) => sales.close,
                          markerSettings: MarkerSettings(
                            isVisible: true, // Afficher les marqueurs
                            shape: DataMarkerType
                                .circle, // Forme du marqueur (circle, square, etc.)
                            color: Colors.red
                                .withOpacity(0.5), // Couleur des marqueurs
                            width: 4, // Largeur des marqueurs
                          ),
                        )
                      : SplineSeries<Modeltradenet, DateTime>(
                          dataSource: chartDatatrade2,
                          width: 2,
                          xValueMapper: (Modeltradenet sales, _) => sales.date,
                          yValueMapper: (Modeltradenet sales, _) => sales.close,
                        )
                ],

                primaryXAxis: DateTimeAxis(
                    plotBands: <PlotBand>[
                      PlotBand(
                          //start: DateTime(2023, 10, 20, 20, 00),
                          start: DateTime.parse(
                              titlelist.entries.elementAt(3).value),
                          end: DateTime(2023, 10, 23, 06, 30),
                          textAngle: 0,
                          verticalTextAlignment: TextAnchor.start,
                          verticalTextPadding: '%-5',
                          //text: 'Christmas Offer \nDec 2017',
                          //textStyle: TextStyle(color: Colors.red, fontSize: 13),
                          color: const Color.fromRGBO(50, 198, 255, 1),
                          opacity: 0.3),
                    ],
                    maximum: DateTime.now().add(const Duration(minutes: 15)),
                    dateFormat: DateFormat.Hms(),
                    majorGridLines: const MajorGridLines(width: 0)),
                primaryYAxis: NumericAxis(
                  isVisible: false,
                  majorGridLines:
                      const MajorGridLines(color: Colors.transparent),
                  minorGridLines:
                      const MinorGridLines(color: Colors.transparent),
                  // minimum: 1,
                  // maximum: 1,
                  // interval: 0.001,
                  // numberFormat:
                  //     NumberFormat.simpleCurrency(decimalDigits: 0)
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50.sp,
                    decoration: BoxDecoration(
                        color: const Color(0xFF6334A9).withOpacity(0.8),
                        borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                    //height: 40.sp,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              iconSize: 12,
                              color: Colors.white,
                              onPressed: () {},
                              icon: const Icon(Icons.horizontal_rule_outlined)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                '\$30 000',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'investissemnt',
                                  style: TextStyle(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              iconSize: 12,
                              color: Colors.white,
                              onPressed: () {},
                              icon: const Icon(Icons.add)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50.sp,
                    decoration: BoxDecoration(
                        color: const Color(0xFF6334A9).withOpacity(0.8),
                        borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                    //height: 40.sp,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              iconSize: 12,
                              color: Colors.white,
                              onPressed: () {},
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                '\$10 000',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Strike rale',
                                  style: TextStyle(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              iconSize: 12,
                              color: Colors.white,
                              onPressed: () {},
                              icon:
                                  const Icon(Icons.keyboard_arrow_up_outlined)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          print(DateTime.parse(
                              titlelist.entries.elementAt(3).value));
                        },
                        child: Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Sell',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              '50%',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.sp,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          miser();
                        },
                        child: Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Buy',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              '20%',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
