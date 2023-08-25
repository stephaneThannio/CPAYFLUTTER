//import 'package:cpay/models/depottransaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AchatApisItem extends StatelessWidget {
  const AchatApisItem(
      {super.key,
      required this.status,
      required this.date,
      required this.montant,
      required this.info});
  final String status;
  final String date;
  final String montant;
  final String info;

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
                    image: info == "MVOLA"
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
