import 'dart:io';

//import 'package:flutter/foundation.dart';
import 'package:cpay/pages/virement.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;
  Barcode? barcode;
  String ibanscan = "";
  @override
  void dispose() {
    qrViewController?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await qrViewController!.pauseCamera();
    }
    qrViewController!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          buildQrView(context),
          Align(
            alignment: const Alignment(0, 1),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                barcode != null
                    ? "Resultat = ${barcode!.code}"
                    : "veillez scanner le code!",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderWidth: 8,
            borderRadius: 10,
            borderColor: const Color(0xFF6334A9),
            cutOutSize: MediaQuery.of(context).size.width * 0.6),
      );

  void onQRViewCreated(QRViewController qrViewController) {
    this.qrViewController = qrViewController;
    qrViewController.scannedDataStream.listen((barcode) {
      if (mounted) {
        setState(() {
          this.barcode = barcode;
          ibanscan = barcode.code.toString();
          print("iban: $ibanscan");
          Virement.ibanQr = ibanscan;
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Virement()));
          qrViewController.stopCamera();
        });
      }
    });
  }
}
