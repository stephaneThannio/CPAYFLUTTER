import 'package:flutter/material.dart';

class TextFieldPreuse extends StatelessWidget {
  final Icon? prefixIco;
  final TextInputType typeWord;
  final bool obscur;
  final IconButton? sufixICO;
  final String? label;
  final String? hint;
  final TextEditingController control;
  final colorinside;
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
      width: 300,
      height: 50,
      child: TextField(
        controller: control,
        obscureText: obscur,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        keyboardType: typeWord,
        decoration: InputDecoration(
            hintText: hint,
            labelStyle: const TextStyle(color: Colors.white),
            fillColor: colorinside,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 5),
                borderRadius: BorderRadius.all(Radius.circular(60))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 5),
                borderRadius: BorderRadius.all(Radius.circular(60))),
            filled: true,
            labelText: label,
            prefixIcon: prefixIco,
            suffixIcon: sufixICO),
      ),
    );
  }
}
