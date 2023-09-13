import 'dart:async';
import 'dart:math';

import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/articles.dart';

class OneArticle extends StatefulWidget {
  const OneArticle(
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
  State<OneArticle> createState() => _OneArticleState();
}

class _OneArticleState extends State<OneArticle> {
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
          width: screenwidth * 0.8,
          child: Card(
            elevation: 2,
            //color: widget.couleurCpay.withOpacity(0.6),
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.photos)),
                        //color: Colors.amber,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    //height: 200.sp,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(1, -1),
                          child: ClipPath(
                            clipper: TrapeziumClipper(),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Transform.rotate(
                                  angle: pi / 4,
                                  child: Align(
                                    alignment: Alignment(0.5, -0.7),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      widget.reference,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.normal,
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
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            widthFactor: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  textAlign: TextAlign.left,
                                  'Tirage dans:24:00:00',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.normal,
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
                Expanded(
                  child: Stack(children: [
                    Align(
                      alignment: Alignment(0.9, -1),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage('lib/photos/285-min.png'),
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: FractionallySizedBox(
                        heightFactor: 1,
                        widthFactor: 0.8,
                        child: ClipPath(
                          clipper: UpperNipMessageClipper(MessageType.send,
                              bubbleRadius: 20, sizeOfNip: 20, sizeRatio: 2),
                          child: Container(
                            margin: EdgeInsets.only(top: 25),
                            decoration: BoxDecoration(
                                color: const Color(0xFFd2d6de),
                                borderRadius: BorderRadius.circular(10)),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  widget.designation,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    heightFactor: 0.9,
                    child: Card(
                        elevation: 2,
                        color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Icon(
                                size: 50,
                                Icons.calendar_month,
                                color: Colors.black,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Ticket 0 MGA',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'PlusJakartaSans',
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.black,
                                  width: 120,
                                  height: 1,
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    '0% Avant tirage',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontFamily: 'PlusJakartaSans',
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.sp, right: 40.sp),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: const Color(0xFF6334A9)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Achat ticket',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Icon(
                                  size: 23.sp,
                                  Icons.shopping_cart_rounded,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      onPressed: () => {}),
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
