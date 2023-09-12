import 'dart:async';

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
  int percent = 0;
  late Timer time;
  progressAnimation(int nb) {
    if (mounted) {
      setState(() {
        if (init < nb * 0.5) {
          init = init + 0.1;
          percent = (init * 100).toInt();
        } else {
          time.cancel();
        }
      });
    }
  }

  animProgress() {
    time = Timer.periodic(const Duration(milliseconds: 100), (timer) {
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
            color: widget.couleurCpay.withOpacity(0.6),
            child: Padding(
              padding: EdgeInsets.all(7.0.sp),
              child: Row(
                children: <Widget>[
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                    //child: Image.network(widget.photos),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.photos)),
                      //color: Colors.orange,
                    ),
                    height: 160.sh,
                    width: 140.w,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 160.w,
                      //color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            //color: Colors.green,
                            child: Text(
                              textAlign: TextAlign.center,
                              widget.designation,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            //color: Colors.orange,
                            child: Text(
                              textAlign: TextAlign.center,
                              widget.reference,
                              style: TextStyle(
                                // shadows: [
                                //   Shadow(
                                //     color: Colors.black.withOpacity(0.8),
                                //     blurRadius: 10.0,
                                //     offset: const Offset(0, 4),
                                //   ),
                                // ],
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              //color: Colors.orange,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      '${widget.prix_ticket} MGA',
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        // shadows: [
                                        //   Shadow(
                                        //     color: Colors.black.withOpacity(0.8),
                                        //     blurRadius: 10.0,
                                        //     offset: const Offset(0, 4),
                                        //   ),
                                        // ],
                                        fontSize: 10.sp,

                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                        fontFamily: 'PlusJakartaSans',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF34A94E),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          'Achat ticket',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                            fontFamily: 'PlusJakartaSans',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              FractionallySizedBox(
                                widthFactor: 0.7,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 10.h,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: FractionallySizedBox(
                                      alignment: Alignment.centerLeft,
                                      widthFactor: init,
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
                                alignment: Alignment.centerRight,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "$percent %",
                                  style: TextStyle(
                                    // shadows: [
                                    //   Shadow(
                                    //     color: Colors.black.withOpacity(0.8),
                                    //     blurRadius: 10.0,
                                    //     offset: const Offset(0, 4),
                                    //   ),
                                    // ],
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              ),
                            ],
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
          ),
        ),
      ),
    );
  }
}
