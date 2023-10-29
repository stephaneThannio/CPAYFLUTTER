import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6334A9),
      body: Center(
        child: ClipPath(
          clipper: TrapeziumClipper(),
          child: const SizedBox(
            height: 200,
            width: 400,
            child: Card(
              elevation: 2,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.addOval(
        Rect.fromCircle(center: Offset(size.width / 3, 0.0), radius: 20.0));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 3, size.height), radius: 20.0));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
