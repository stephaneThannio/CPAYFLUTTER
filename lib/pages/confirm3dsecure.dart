import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:cpay/api/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Secure3d extends StatefulWidget {
  const Secure3d({super.key});

  @override
  State<Secure3d> createState() => _Secure3dState();
}

class _Secure3dState extends State<Secure3d> {
  // List<int> code = [];
  String _commingSms = 'Unknown';
  // setcodece(String msg) {
  //   print(msg.substring(20, 27));
  // }

  Future<void> initSmsListener() async {
    String? commingSms;

    try {
      commingSms = await AltSmsAutofill().listenForSms;
    } on PlatformException {
      commingSms = 'Failed to get Sms.';
    }
    if (!mounted) return;

    setState(() {
      _commingSms = commingSms!.substring(20, 27);
    });
  }

  sendCode() async {
    await Api.send3dcode("1000");
  }

  @override
  void initState() {
    // TODO: implement initState
    initSmsListener();
    super.initState();
  }

  @override
  void dispose() {
    AltSmsAutofill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 400,
                width: 500,
                color: Colors.yellow,
                child: Text('Running on: $_commingSms\n'),
              ),
              // TextButton(
              //   child: Text('Listen for sms code'),
              //   onPressed: () {
              //     setcodece(_commingSms);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
