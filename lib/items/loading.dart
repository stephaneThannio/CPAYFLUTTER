import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final Color? couleur;
  const Loading({super.key, required this.couleur});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: SpinKitChasingDots(
          color: couleur,
          size: 50,
        ),
      ),
    );
  }
}
