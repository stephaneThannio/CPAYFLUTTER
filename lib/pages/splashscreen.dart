import 'package:cpay/main.dart';
import 'package:cpay/pages/Accueil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
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
          context, MaterialPageRoute(builder: (context) => const MyApp()));
    }
  }

  void verifuse() {
    ifuse().whenComplete(() => gotohome());
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
