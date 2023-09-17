import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingLisview extends StatefulWidget {
  const LoadingLisview({super.key});

  @override
  State<LoadingLisview> createState() => _LoadingLisviewState();
}

class _LoadingLisviewState extends State<LoadingLisview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // color: Colors.amber,
          height: 10,
          width: 100,
          child: const Center(
            child: SpinKitThreeBounce(color: const Color(0xFF6334A9)),
          ),
        ),
      ),
    );
  }
}
