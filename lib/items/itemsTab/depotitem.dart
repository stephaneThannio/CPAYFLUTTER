import 'package:cpay/models/depottransaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DepotItem extends StatelessWidget {
  const DepotItem({super.key, required this.depots});
  final Depotransaction depots;

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
                depots.status,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF6334A9),
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
              subtitle: Text(
                depots.date,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
              trailing: Text(
                depots.montant,
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
                    color: Colors.grey),
                child: IconButton(
                  icon: Image(
                    width: 30.sp,
                    height: 30.sp,
                    image: AssetImage('lib/photos/mvola.webp'),
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
