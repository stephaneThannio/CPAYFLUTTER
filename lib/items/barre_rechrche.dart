import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class BarreRech extends StatefulWidget {
  BarreRech(
      {super.key,
      required this.context,
      required this.affichCategries,
      required this.onchangedtext});
  BuildContext context;
  final Function affichCategries;
  final Function onchangedtext;
  static String text = '';
  @override
  State<BarreRech> createState() => _BarreRechState();
}

class _BarreRechState extends State<BarreRech> {
  TextEditingController textcontroller = TextEditingController();
  @override
  Widget build(context) {
    return Container(
      height: 50.spMax,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: const Color(0xFF6334A9),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Expanded(
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 220.spMax,
              //color: Colors.green,
              child: TextField(
                controller: textcontroller,
                onEditingComplete: () {
                  BarreRech.text = textcontroller.text;
                  widget.onchangedtext();
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                maxLines: 1,
                decoration: const InputDecoration.collapsed(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Rechercher...",
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                  onPressed: () {
                    widget.affichCategries();
                  },
                  icon: const Icon(
                    Icons.tune_rounded,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
