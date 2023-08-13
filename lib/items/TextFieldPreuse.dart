import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldPreuse extends StatelessWidget {
  final Icon? prefixIco;
  final TextInputType typeWord;
  final bool obscur;
  final IconButton? sufixICO;
  final String? label;
  final String? hint;
  final TextEditingController control;
  final Color colorinside;
  const TextFieldPreuse({
    super.key,
    required this.obscur,
    this.prefixIco,
    this.colorinside = const Color(0xFF6334A9),
    required this.typeWord,
    this.hint,
    this.sufixICO,
    this.label,
    required this.control,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.red,
      width: 300.w,
      child: TextField(
        controller: control,
        obscureText: obscur,
        cursorColor: Colors.white,
        style: TextStyle(fontSize: 12.sp, color: Colors.white),
        keyboardType: typeWord,
        decoration: InputDecoration(
            //contentPadding: EdgeInsets.all(18.sp),
            hintText: hint,
            labelStyle: TextStyle(fontSize: 12.sp, color: Colors.white),
            fillColor: colorinside,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 5.w),
                borderRadius: const BorderRadius.all(Radius.circular(60))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 5.w),
                borderRadius: const BorderRadius.all(Radius.circular(60))),
            filled: true,
            labelText: label,
            prefixIcon: prefixIco,
            suffixIcon: sufixICO),
      ),
    );
  }
}
