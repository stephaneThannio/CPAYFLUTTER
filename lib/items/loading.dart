import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final Color? spincouleur;
  final Color? containcouleur;
  const Loading(
      {super.key, required this.spincouleur, required this.containcouleur});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 450,
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
