import 'package:flutter/material.dart';

import '../models/articles.dart';

class cardArticle extends StatelessWidget {
  const cardArticle(
      {super.key, required this.couleurCpay, required this.article});
  final Article article;
  final Color couleurCpay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 8,
            blurRadius: 7,
            offset: Offset(0, 3), // Décalage de l'ombre
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: couleurCpay.withOpacity(0.4),
      ),
      height: 250,
      width: 180,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(article.image)),
              //color: Colors.orange,
            ),
            height: 180,
            width: 160,
          ),
          Container(
            //color: Colors.green,
            height: 50,
            width: 160,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: couleurCpay.withOpacity(0.6)),
                      child: const Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'Titre',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: couleurCpay.withOpacity(0.6)),
                      child: const Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'Prix',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: couleurCpay.withOpacity(0.6)),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          article.titre,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: couleurCpay.withOpacity(0.6)),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          article.prix,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
