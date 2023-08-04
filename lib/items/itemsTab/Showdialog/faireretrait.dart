import 'package:flutter/material.dart';

class Retireit extends StatefulWidget {
  const Retireit({super.key});

  @override
  State<Retireit> createState() => _RetireitState();
}

//test
class _RetireitState extends State<Retireit> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10), // Vous pouvez ajuster le rayon ici
      ),
      title: const Center(child: Text('Faire un retrait')),
      children: [
        ListTile(
          title: const Text('retrait'),
          trailing: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset('lib/photos/mvola.webp'),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      icon: const Icon(Icons.money),
                      labelText: 'Montant en ariary',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'code de securite du telephone'),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                //color: Colors.red,
                width: 200,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6334A9)),
                    child: const Text(
                      textAlign: TextAlign.center,
                      'Continuer',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                    onPressed: () => {}),
              ),
            ),
          ],
        )
      ],
    );
  }
}
