import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/articles.dart';

class CardArticle extends StatefulWidget {
  const CardArticle(
      {super.key,
      required this.couleurCpay,
      required this.id,
      required this.id_categorie,
      required this.categorie,
      required this.photos,
      required this.designation,
      required this.prix_ticket,
      required this.reference,
      required this.pourcentage,
      required this.date_tirage});
  final String id;
  final String id_categorie;
  final String categorie;
  final String photos;
  final String designation;
  final String prix_ticket;
  final String reference;
  final int pourcentage;
  final String date_tirage;
  //final Article article;
  final Color couleurCpay;

  @override
  State<CardArticle> createState() => _CardArticleState();
}

class _CardArticleState extends State<CardArticle> {
  double init = 0.0;
  double percent = 0;
  late Timer time;
  progressAnimation(int nb) {
    if (mounted) {
      setState(() {
        if (init < nb / 100) {
          init = init + 0.01;
          percent = init * 100;
        } else {
          time.cancel();
        }
      });
    }
  }

  animProgress() {
    time = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      progressAnimation(widget.pourcentage);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animProgress();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenwidth,
          child: Card(
            elevation: 2,
            color: widget.couleurCpay.withOpacity(0.8),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      0, 7, 0, 0), //EdgeInsets.all(2.0.sp),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            Container(
                              //child: Image.network(widget.photos),
                              margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(widget.photos)),
                                //color: Colors.orange,
                              ),
                              height: 120.h,
                              width: 140.w,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: ClipPath(
                                  clipper: TrapeziumClipper(),
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: widget.couleurCpay),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Transform.rotate(
                                        angle: pi / 4,
                                        child: Align(
                                          alignment: Alignment(0.5, -0.7),
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              widget.reference,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontFamily: 'PlusJakartaSans',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 150.w,
                                //color: Colors.red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Container(
                                    //   margin: const EdgeInsets.only(bottom: 5),
                                    //   //color: Colors.green,
                                    //   child: FittedBox(
                                    //     fit: BoxFit.scaleDown,
                                    //     child: Text(
                                    //       textAlign: TextAlign.center,
                                    //       '',
                                    //       style: TextStyle(
                                    //         fontSize: 12.sp,
                                    //         fontWeight: FontWeight.bold,
                                    //         color: Colors.white,
                                    //         fontFamily: 'PlusJakartaSans',
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 10, right: 7, top: 20),
                                      //color: Colors.orange,
                                      child: Text(
                                        //textAlign: TextAlign.center,
                                        widget.designation,
                                        style: TextStyle(
                                          // shadows: [
                                          //   Shadow(
                                          //     color: Colors.black.withOpacity(0.8),
                                          //     blurRadius: 10.0,
                                          //     offset: const Offset(0, 4),
                                          //   ),
                                          // ],
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontFamily: 'PlusJakartaSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Card(
                                          elevation: 2,
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 7, 0),
                                          color: widget.couleurCpay,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Icon(
                                                  size: 30,
                                                  Icons.calendar_month,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: 150,
                                                      //color: Colors.red,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: FittedBox(
                                                          fit: BoxFit.scaleDown,
                                                          child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            'Ticket 50 000 MGA',
                                                            style: TextStyle(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'PlusJakartaSans',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    color: Colors.white,
                                                    width: 120,
                                                    height: 1,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      width: 150,
                                                      //color: Colors.red,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: FittedBox(
                                                          fit: BoxFit.scaleDown,
                                                          child: Text(
                                                            '0% Avant tirage',
                                                            style: TextStyle(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'PlusJakartaSans',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                    ),

                                    // StepProgressIndicator(
                                    //   totalSteps: 90,
                                    //   currentStep: 32,
                                    //   padding: 2,
                                    //   selectedColor: Color(0xFF6334A9),
                                    //   unselectedColor: Colors.white,
                                    //   roundedEdges: Radius.circular(10),
                                    //   selectedGradientColor: LinearGradient(
                                    //     begin: Alignment.topLeft,
                                    //     end: Alignment.bottomRight,
                                    //     colors: [
                                    //       Color(0xFF6334A9).withOpacity(0.7),
                                    //       Color(0xFF6334A9)
                                    //     ],
                                    //   ),
                                    //   unselectedGradientColor: LinearGradient(
                                    //       begin: Alignment.topCenter,
                                    //       end: Alignment.topLeft,
                                    //       colors: [Colors.black, Colors.blue]),
                                    // )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Stack(
                        children: [
                          FractionallySizedBox(
                            widthFactor: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              height: 7.h,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: 0.5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: widget.couleurCpay,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              textAlign: TextAlign.center,
                              "${percent.toStringAsFixed(0)} %",
                              style: TextStyle(
                                // shadows: [
                                //   Shadow(
                                //     color: Colors.black.withOpacity(0.8),
                                //     blurRadius: 10.0,
                                //     offset: const Offset(0, 4),
                                //   ),
                                // ],
                                fontSize: 5.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.sp,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    height: 26,
                    width: 100,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Tirage dans 24:00:00',
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    //path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
