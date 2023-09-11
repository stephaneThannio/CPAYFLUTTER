import 'dart:convert';

import 'package:cpay/api/api.dart';
import 'package:cpay/items/loading.dart';
import 'package:cpay/models/modeltrade.dart';
import 'package:cpay/models/modeltradenet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class Trading extends StatefulWidget {
  const Trading({super.key});

  @override
  State<Trading> createState() => _TradingState();
}

class _TradingState extends State<Trading> {
  Map<String, dynamic> titlelist = {};
  List<Modeltradenet> chartDatatrade = [];
  List<Modeltradenet> chartDatatrade2 = [];
  CrosshairBehavior crosshairBehavior =
      CrosshairBehavior(enable: true, activationMode: ActivationMode.singleTap);
  DateTime lastDataPointX = DateTime.now();
  double lastDataPointY = 0.0;
  bool loading = false;
  late TrackballBehavior _trackballBehavior;
  afficherligne() {
    print(chartDatatrade2);
    setState(() {
      //print(chartDatatrade2);
      // Rafraîchissez le graphique après chaque mise à jour des données
      //if (chartDatatrade.isNotEmpty) {
      lastDataPointX = chartDatatrade.first.date;
      lastDataPointY = chartDatatrade.first.close;
      // crosshairBehavior.show(lastDataPointX, lastDataPointY);
      // _trackballBehavior.show(lastDataPointX, lastDataPointY);
      print(lastDataPointX);
      print(lastDataPointY);
      //}
    });
  }

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
            // chartDatatrade2 =
            //     listaftertransform(data["Time Series FX (5min)"][0]);
            titlelist = data["Meta Data"];
            print(titlelist["1. Information"]);
            lastDataPointX = chartDatatrade.first.date;
            lastDataPointY = chartDatatrade.first.close;
          });
        }
        Future.delayed(Duration(minutes: 5), () {
          gettrade();
        });

        // Modeltradenet modeltradenet =
        //     Modeltradenet.fromJson(data["Time Series FX (5min)"]);
        // list.add(modeltradenet);
        // data["Time Series FX (5min)"]['$formattedDateTime:00']);
        //print(data["Time Series (1min)"]);
        //print(modeltradenet);
        //return (modeltradenet);
        // Future.delayed(Duration(minutes: 5), () {
        //   getapitrading();
        // });
      } else {
        print("request not send");
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
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
              Expanded(
                child: SfCartesianChart(
                  trackballBehavior: _trackballBehavior,
                  crosshairBehavior: CrosshairBehavior(
                      enable: true, activationMode: ActivationMode.singleTap),
                  // annotations: <CartesianChartAnnotation>[
                  //   //Annotations personnalisées pour les signaux d'achat/vente
                  //   CartesianChartAnnotation(
                  //     region: AnnotationRegion.plotArea,
                  //     widget: Container(
                  //       decoration: BoxDecoration(
                  //           color: const Color(0xFF6334A9),
                  //           borderRadius: BorderRadius.circular(50)),
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Text(
                  //           lastDataPointY.toString(),
                  //           style: TextStyle(color: Colors.white),
                  //         ),
                  //       ),
                  //       // height: 40,
                  //       // width: 40,
                  //       //child: Text('hello'),
                  //     ),
                  //     //x: DateTime.now().microsecondsSinceEpoch,
                  //     coordinateUnit: CoordinateUnit.point,
                  //     x: lastDataPointX
                  //         .subtract(Duration(hours: 2)), // Position x en tant que date
                  //     y: lastDataPointY,
                  //     // Valeur de l'axe Y où afficher le signal d'achat
                  //   ),

                  //   //Ajoutez plus d'annotations pour d'autres signaux d'achat/vente
                  // ],
                  //crosshairBehavior: crosshairBehavior,
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
                    )
                  ],
                  primaryXAxis: DateTimeAxis(
                      maximum: DateTime.now().add(Duration(minutes: 15)),
                      dateFormat: DateFormat.Hms(),
                      majorGridLines: MajorGridLines(width: 0)),
                  primaryYAxis: NumericAxis(
                    isVisible: false,
                    majorGridLines: MajorGridLines(color: Colors.transparent),
                    minorGridLines: MinorGridLines(color: Colors.transparent),
                    // minimum: 1,
                    // maximum: 1,
                    // interval: 0.001,
                    // numberFormat:
                    //     NumberFormat.simpleCurrency(decimalDigits: 0)
                  ),
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
                        onPressed: () {},
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
                        onPressed: () {},
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
