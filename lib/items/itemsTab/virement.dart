import 'package:cpay/items/itemsTab/virementitem.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//
class Virement extends StatefulWidget {
  const Virement({super.key, required this.list, required this.control});
//
  final List list;

  final ScrollController control;

  @override
  State<Virement> createState() => _VirementState();
}

class _VirementState extends State<Virement> {
  int place = -1;
  List listplace = [];
  double heightmin = 70;
  bool zoom = true;
  setHeight() {
    if (heightmin == 70) {
      setState(() {
        heightmin = 100;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
<<<<<<< HEAD
        controller: widget.control,
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setHeight();
              setState(() {
                place = index;
                listplace.add(place);
              });
              if (listplace.length >= 2) {
                if (listplace[0] == listplace[1]) {
                  Future.delayed(Duration(milliseconds: 100), () {
                    setState(() {
                      heightmin = 70;
                      listplace.clear();
                      // zoom = true;
                    });
                  });
                }
                listplace.clear();
                listplace.add(place);
              }
            },
            child: Builder(builder: (context) {
              if (place == index) {
                return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    height: heightmin.spMax,
                    child: VirementItem(
                      affiche: heightmin == 70 ? false : true,
                      status: widget.list[index]["status_payment"],
                      date: widget.list[index]["date"],
                      montant: widget.list[index]["montant"],
                      type: widget.list[index]["type"],
                      periodicite: widget.list[index]["periodicite"].toString(),
                      destination: widget.list[index]["destination"],
                      motif: widget.list[index]["motif"],
                    ));
              } else {
                return AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.fastOutSlowIn,
                    height: 70.spMax,
                    child: VirementItem(
                      affiche: false,
                      status: widget.list[index]["status_payment"],
                      date: widget.list[index]["date"],
                      montant: widget.list[index]["montant"],
                      type: widget.list[index]["type"],
                      periodicite: widget.list[index]["periodicite"].toString(),
                      destination: widget.list[index]["destination"],
                      motif: widget.list[index]["motif"],
                    ));
              }
            }),
          );
        });
=======
        controller: control,
        itemCount: list.length,
        itemBuilder: (context, index) => SizedBox(
            height: 70.spMax,
            child: VirementItem(
                status: list[index]["status_payment"],
                date: list[index]["date"],
                montant: list[index]["montant"],
                type: list[index]["type"],
                destination: list[index]["destination"],
                motif: list[index]["motif"])));
>>>>>>> 5e0a9c28389311f5a5a0c6c5604bc93a42b1d631
  }
}
