//import 'package:cpay/models/depottransaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DepotItem extends StatelessWidget {
  const DepotItem(
      {super.key,
      required this.status,
      required this.date,
      required this.montant,
      required this.application});
  final String status;
  final String date;
  final String montant;
  final String application;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenwidth * 0.9,
          child: Card(
            elevation: 2,
            color: Colors.white,
            child: ListTile(
              title: Text(
                status,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF6334A9),
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
              subtitle: Text(
                date,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
              trailing: Text(
                "$montant MGA",
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
                    image: application == "MVOLA"
                        ? const AssetImage('lib/photos/mvola.webp')
                        : const AssetImage('lib/photos/banktransfert.png'),
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
