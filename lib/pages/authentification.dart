import 'package:cpay/pages/login.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

//import 'createAcount.dart';

class Authentification extends StatefulWidget {
  const Authentification({super.key});

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  bool page = true;
  setpage() {
    if (page) {
      setState(() {
        page = false;
      });
    } else {
      setState(() {
        page = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xFF6334A9),
        body: SizedBox(
          height: screenheight,
          //color: Colors.red,
          child: const Center(child: Login()),
        ));
  }
}
