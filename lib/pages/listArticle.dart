import 'package:cpay/items/cardArticle.dart';
import 'package:cpay/models/articles.dart';
import 'package:flutter/material.dart';

class ListArticle extends StatefulWidget {
  const ListArticle({super.key});

  @override
  State<ListArticle> createState() => _ListArticleState();
}

class _ListArticleState extends State<ListArticle> {
  Color couleurCpay = const Color(0xFF6334A9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.red,
      height: 800,
      child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, i) {
            return SizedBox(
                height: 200,
                child: CardArticle(
                    couleurCpay: couleurCpay, article: articles[i]));
          }),
    ));
  }
}
