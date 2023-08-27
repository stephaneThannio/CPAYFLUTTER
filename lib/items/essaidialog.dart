import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertAlert extends StatelessWidget {
  const AlertAlert(
      {super.key,
      required this.typealert,
      required this.titleAlert,
      required this.descriAlert,
      this.confirmbtnText = "Valider",
      this.cancelbtn = false,
      this.cancelbtnText = "Annuler",
      this.onpresConfirm});

  final String typealert;
  final String titleAlert;
  final String descriAlert;
  final String cancelbtnText;
  final String confirmbtnText;
  final bool cancelbtn;
  final VoidCallback? onpresConfirm;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: typealert == "succes"
                ? Colors.green
                : (typealert == "error" ? Colors.red : const Color(0xFF6334A9)),
            borderRadius: BorderRadius.circular(20)),
        height: 300.sp,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(typealert == "succes"
                              ? 'lib/photos/gif_alert/succes3.gif'
                              : (typealert == "error"
                                  ? 'lib/photos/gif_alert/error.gif'
                                  : (typealert == "warning"
                                      ? 'lib/photos/gif_alert/warning.gif'
                                      : (typealert == "info"
                                          ? 'lib/photos/gif_alert/informaton2.gif'
                                          : 'lib/photos/gif_alert/doyouwant1.gif'))))),
                      borderRadius: BorderRadius.circular(60.sp)),
                  height: 100.sp,
                  width: 100.sp,
                ),
              ),
              Expanded(
                  child: FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            titleAlert,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              // fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            descriAlert,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              // fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                        ],
                      ),
                      cancelbtn == true
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          )),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          cancelbtnText,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontFamily: 'PlusJakartaSans',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.sp,
                                    ),
                                    ElevatedButton(
                                      onPressed: onpresConfirm,
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF6334A9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          )),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          confirmbtnText,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontFamily: 'PlusJakartaSans',
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: onpresConfirm,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF6334A9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              child: Text(
                                textAlign: TextAlign.center,
                                confirmbtnText,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    ).animate().scale(duration: Duration(milliseconds: 100));
  }
}
