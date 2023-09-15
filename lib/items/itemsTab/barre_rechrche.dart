import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class BarreRech extends StatelessWidget {
  BarreRech({super.key, required this.context});
  BuildContext context;

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
            Expanded(
              child: Container(
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: 220.spMax,
              //color: Colors.green,
              child: const TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                maxLines: 1,
                decoration: InputDecoration.collapsed(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Rechercher...",
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.tune_rounded,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
