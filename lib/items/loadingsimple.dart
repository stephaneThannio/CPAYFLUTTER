import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final Color? spincouleur;

  const Loading({
    super.key,
    required this.spincouleur,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.center,
        child: SpinKitChasingDots(
          color: spincouleur,
          size: 50,
        ),
      ),
    );
  }
}
