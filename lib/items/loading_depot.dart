import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDepot extends StatelessWidget {
  final Color? spincouleur;
  final Color? containcouleur;
  final String titreLoadingDepot;
  final String contenttext;
  final double hauteurContainer;
  final MainAxisAlignment alingementmainax;
  const LoadingDepot(
      {super.key,
      required this.spincouleur,
      required this.containcouleur,
      this.titreLoadingDepot = "",
      this.contenttext = "",
      this.hauteurContainer = 450,
      this.alingementmainax = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: hauteurContainer.h,
        // color: Colors.amber,
        color: containcouleur,
        child: Column(
          mainAxisAlignment: alingementmainax,
          children: [
            Text(
              textAlign: TextAlign.center,
              titreLoadingDepot.toString(),
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'PlusJakartaSans',
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              contenttext.toString(),
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontFamily: 'PlusJakartaSans',
              ),
            ),
            SpinKitChasingDots(
              color: spincouleur,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
