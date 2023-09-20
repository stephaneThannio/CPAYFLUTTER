import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingLisview extends StatefulWidget {
  const LoadingLisview({super.key});

  @override
  State<LoadingLisview> createState() => _LoadingLisviewState();
}

class _LoadingLisviewState extends State<LoadingLisview> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          // color: Colors.amber,
          height: 10,
          width: 100,
          child: Center(
            child: SpinKitThreeBounce(color: Color(0xFF6334A9)),
          ),
        ),
      ),
    );
  }
}
