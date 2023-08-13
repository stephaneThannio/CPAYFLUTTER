// ignore_for_file: sort_child_properties_last

import 'package:cpay/pages/premierDemarage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/Accueil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: (context, child) => MaterialApp(
              title: 'CPAY',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const MyHomePage(title: 'CPAY Company For Madagascar'),
            ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // This widget is the root of your application.
  bool firstuses = false;
  var use;
  // Future uses() async {
  //   SharedPreferences spref = await SharedPreferences.getInstance();
  //   firstuses = true;
  //   spref.setBool("usescase", firstuses);
  //   spref.commit();
  // }

  Future ifuse() async {
    SharedPreferences ifuses = await SharedPreferences.getInstance();
    use = ifuses.getBool("usescase");
  }

  gotohome() {
    if (use == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Accueil()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Commencer()));
    }
  }

  attendre() {
    Future.delayed(const Duration(seconds: 1), gotohome);
  }

  void verifuse() {
    ifuse().whenComplete(() => attendre());
  }

  props() {}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifuse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          //color: Colors.red,
          height: 150,
          width: 150,
          child: Column(
            children: [
              Expanded(
                child: Image.asset(('lib/photos/285-min.png')),
              ),
              const Expanded(
                  child: SpinKitSpinningLines(color: Color(0xFF6334A9)))
            ],
          ),
        ),
      ),
    );
  }
}
