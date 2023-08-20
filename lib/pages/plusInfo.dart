import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoBnc extends StatelessWidget {
  const InfoBnc({
    super.key,
    required this.list,
  });
  final List<Map<String, dynamic>> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              color: const Color(0xFF6334A9),
              child: Column(
                children: [
                  Container(
                    height: 250.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.sp),
                            bottomRight: Radius.circular(50.sp))),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40.sp,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'Virement Bancaire',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.sp),
                            topRight: Radius.circular(50.sp))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.sp,
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.7,
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.black.withOpacity(0.1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(0, 4),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            width: 100.w,
                            height: 28.h,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        // color: Colors.blue,
                                        height: 50.sp,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Montant a trasferer',
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(60.sp)),
                                          border: Border.all(
                                            width: 1,
                                            color: const Color(0xFF6334A9),
                                          ),
                                          //color: Colors.green,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0.sp,
                                              left: 30.0.sp,
                                              right: 30.0.sp),
                                          child: Text(
                                            "Montant à transferer\n${list[0].entries.elementAt(0).value.toString()} EUR",
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF6334A9),
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.sp, right: 20.sp),
                                  child: Container(
                                    //color: Colors.red,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            "REFERENCE",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF6334A9),
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                          subtitle: Text(
                                            list[0]
                                                .entries
                                                .elementAt(5)
                                                .value
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            "IBAN",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF6334A9),
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                          subtitle: Text(
                                            list[0]
                                                .entries
                                                .elementAt(1)
                                                .value
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            "BIC",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF6334A9),
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                          subtitle: Text(
                                            list[0]
                                                .entries
                                                .elementAt(2)
                                                .value
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            "Nom",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF6334A9),
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                          subtitle: Text(
                                            list[0]
                                                .entries
                                                .elementAt(3)
                                                .value
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            "Domiciliation",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF6334A9),
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                          subtitle: Text(
                                            list[0]
                                                .entries
                                                .elementAt(4)
                                                .value
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            "DATE",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF6334A9),
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                          subtitle: Text(
                                            list[0]
                                                .entries
                                                .elementAt(6)
                                                .value
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, -0.5),
              child: Container(
                height: 170.sp,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('lib/photos/banktransfert.png')),
                    color: const Color(0xFF452475),
                    borderRadius: BorderRadius.circular(20.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
