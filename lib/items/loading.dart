import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final Color? spincouleur;
  final Color? containcouleur;
  final double hauteurContainer;
  const Loading(
      {super.key,
      required this.spincouleur,
      required this.containcouleur,
      this.hauteurContainer = 450});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: hauteurContainer,
        // color: Colors.amber,
        color: containcouleur,
        child: Align(
          alignment: Alignment.topCenter,
          child: SpinKitChasingDots(
            color: spincouleur,
            size: 50,
          ),
        ),
      ),
    );
  }
}
