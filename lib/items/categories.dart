import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categoris extends StatefulWidget {
  const Categoris({super.key});

  @override
  State<Categoris> createState() => _CategorisState();
}

class _CategorisState extends State<Categoris> {
  bool checkboxvalFourniture = true;
  bool checkboxvalinformatique = true;
  bool checkboxvalMode = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: 200,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                onChanged: (bool? value) {
                  if (value != null) {
                    setState(() {
                      checkboxvalFourniture = value;
                    });
                  }
                },
                value: checkboxvalFourniture,
              ),
              Text(
                textAlign: TextAlign.center,
                'Fourniture Scolaire',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                onChanged: (bool? value) {
                  if (value != null) {
                    setState(() {
                      checkboxvalinformatique = value;
                    });
                  }
                },
                value: checkboxvalinformatique,
              ),
              Text(
                textAlign: TextAlign.center,
                'informatique',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                onChanged: (bool? value) {
                  if (value != null) {
                    setState(() {
                      checkboxvalMode = value;
                    });
                  }
                },
                value: checkboxvalMode,
              ),
              Text(
                textAlign: TextAlign.center,
                'Mode',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color(0xFF6334A9)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            textAlign: TextAlign.center,
                            'Valider',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                onPressed: () => {}),
          ),
        ],
      ),
    );
  }
}
