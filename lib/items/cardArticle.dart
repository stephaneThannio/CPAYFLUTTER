import 'package:flutter/material.dart';

import '../models/articles.dart';

class CardArticle extends StatelessWidget {
  const CardArticle(
      {super.key, required this.couleurCpay, required this.article});
  final Article article;
  final Color couleurCpay;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenwidth,
          child: Card(
            elevation: 2,
            color: couleurCpay.withOpacity(0.4),
            child: Row(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
