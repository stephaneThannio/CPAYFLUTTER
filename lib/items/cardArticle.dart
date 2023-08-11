import 'dart:async';

import 'package:flutter/material.dart';

import '../models/articles.dart';

class CardArticle extends StatefulWidget {
  const CardArticle(
      {super.key, required this.couleurCpay, required this.article});
  final Article article;
  final Color couleurCpay;

  @override
  State<CardArticle> createState() => _CardArticleState();
}

class _CardArticleState extends State<CardArticle> {
  double init = 0.0;
  int percent = 0;
  late Timer time;
  progressAnimation() {
    if (mounted) {
      setState(() {
        if (init < 0.4) {
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
      progressAnimation();
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.article.image)),
                      //color: Colors.orange,
                    ),
                    height: 180,
                    width: 160,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 180,
                      //color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            //color: Colors.green,
                            child: Text(
                              textAlign: TextAlign.center,
                              widget.article.titre,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            //color: Colors.orange,
                            child: const Text(
                              textAlign: TextAlign.center,
                              "ref MBP-320-Madagascar",
                              style: TextStyle(
                                // shadows: [
                                //   Shadow(
                                //     color: Colors.black.withOpacity(0.8),
                                //     blurRadius: 10.0,
                                //     offset: const Offset(0, 4),
                                //   ),
                                // ],
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
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
                                  height: 20,
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
                                  style: const TextStyle(
                                    // shadows: [
                                    //   Shadow(
                                    //     color: Colors.black.withOpacity(0.8),
                                    //     blurRadius: 10.0,
                                    //     offset: const Offset(0, 4),
                                    //   ),
                                    // ],
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              //color: Colors.orange,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    widget.article.prix,
                                    style: const TextStyle(
                                      // shadows: [
                                      //   Shadow(
                                      //     color: Colors.black.withOpacity(0.8),
                                      //     blurRadius: 10.0,
                                      //     offset: const Offset(0, 4),
                                      //   ),
                                      // ],
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                      fontFamily: 'PlusJakartaSans',
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF34A94E),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'Tenter',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                          fontFamily: 'PlusJakartaSans',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
