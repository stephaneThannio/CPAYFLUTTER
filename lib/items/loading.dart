import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final Color? couleur;
  const Loading({super.key, required this.couleur});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 450,
        // color: Colors.amber,
        color: const Color(0xFF6334A9),
        child: Align(
          alignment: Alignment.topCenter,
          child: SpinKitChasingDots(
            color: couleur,
            size: 50,
          ),
        ),
      ),
    );
  }
}
