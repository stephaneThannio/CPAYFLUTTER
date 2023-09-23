import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Itemcategories extends StatefulWidget {
  const Itemcategories({
    super.key,
    this.designation = '',
    this.idcat = '',
  });
  final String designation;
  final String idcat;
  static String idrcu = '';
  static List listselect = [];
  //static String idid = _ItemcategoriesState.idid;
  @override
  State<Itemcategories> createState() => _ItemcategoriesState();
}

class _ItemcategoriesState extends State<Itemcategories> {
  bool checkboxvalFourniture = false;
  setActivation() {
    if (Itemcategories.listselect.contains(widget.idcat)) {
      setState(() {
        checkboxvalFourniture = true;
      });
    }
  }

  filllist() {
    if (!Itemcategories.listselect.contains(widget.idcat)) {
      Itemcategories.listselect.add(widget.idcat);
    }
  }

  //static String idid = '';
  @override
  void initState() {
    // TODO: implement initState
    //filllist();
    setActivation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF6334A9).withOpacity(0.7),
      child: ListTile(
        title: Text(
          //textAlign: TextAlign.start,
          widget.designation,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontFamily: 'PlusJakartaSans',
          ),
        ),
        trailing: Switch(
          onChanged: (bool? value) {
            if (value != null) {
              setState(() {
                checkboxvalFourniture = value;
                // print(widget.idcat);

                // list.add(widget.idcat);
                // print(list);
                Itemcategories.idrcu = widget.idcat;
                if (Itemcategories.listselect.contains(widget.idcat)) {
                  Itemcategories.listselect
                      .removeWhere((element) => element == widget.idcat);
                } else {
                  Itemcategories.listselect.add(widget.idcat);
                }
                // Itemcategories.listselect.add(widget.idcat);
              });
            }
          },
          value: checkboxvalFourniture,
        ),
      ),
    );
  }
}
