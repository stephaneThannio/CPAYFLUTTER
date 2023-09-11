//import 'package:cpay/models/depottransaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VirementItem extends StatefulWidget {
  const VirementItem({
    super.key,
    required this.status,
    required this.date,
    required this.montant,
    required this.type,
    required this.periodicite,
    required this.destination,
    required this.motif,
    required this.affiche,
  });
  final String status;
  final String date;
  final String montant;
  final String type;
  final String periodicite;
  final String destination;
  final String motif;
  final bool affiche;

  @override
  State<VirementItem> createState() => _VirementItemState();
}

class _VirementItemState extends State<VirementItem>
    with SingleTickerProviderStateMixin {
  //late AnimationController _animcontroller;

  // affichemore(bool afficher) {
  //   if (!afficher) {
  //     setState(() {
  //       afficher = true;
  //     });
  //   } else {
  //     setState(() {
  //       afficher = false;
  //     });
  //   }
  // }

  // setcontrol() {
  //   if (afficher) {
  //     _animcontroller.forward();
  //   } else {
  //     _animcontroller.reverse();
  //   }
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _animcontroller = AnimationController(
  //       vsync: this, duration: const Duration(milliseconds: 200));
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _animcontroller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenwidth * 0.8,
          child: Card(
            elevation: 2,
            color: Colors.white,
            child: ListTile(
              //title:
              // Text(
              //   status,
              //   style: TextStyle(
              //     fontSize: 13.sp,
              //     fontWeight: FontWeight.bold,
              //     color: const Color(0xFF6334A9),
              //     fontFamily: 'PlusJakartaSans',
              //   ),
              // ),
              subtitle: SizedBox(
                // duration: Duration(milliseconds: 500),
                // curve: Curves.fastOutSlowIn,
                //color: Colors.amber,
                height: widget.affiche == false ? 100.sp : 85.sp,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.status,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF6334A9),
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                            Text(
                              widget.date,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                            Text(
                              widget.destination,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: widget.affiche,
                        child: Container(
                          //color: Colors.blue,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.type,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                              Text(
                                widget.motif,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                              // Text(
                              //   periodicite,
                              //   style: TextStyle(
                              //     fontSize: 10.sp,
                              //     fontWeight: FontWeight.normal,
                              //     color: Colors.grey,
                              //     fontFamily: 'PlusJakartaSans',
                              //   ),
                              // ),
                            ],
                          ),
                        ).animate().fade(duration: const Duration(seconds: 1)),
                      )
                    ],
                  ),
                ),
              ),
              // Text(
              //   "$date\n$destination\n$type\n$motif",
              //   style: TextStyle(
              //     fontSize: 10.sp,
              //     fontWeight: FontWeight.normal,
              //     color: Colors.grey,
              //     fontFamily: 'PlusJakartaSans',
              //   ),
              // ),
              trailing: Text(
                "${widget.montant} MGA",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF6334A9),
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
              leading: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.sp),
                    color: const Color(0xFF6334A9).withOpacity(0.5)),
                child: IconButton(
                  icon: Image(
                      width: 30.sp,
                      height: 30.sp,
                      image: const AssetImage('lib/photos/285-min.png')
                      // : const AssetImage('lib/photos/banktransfert.png'),
                      ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
