//import 'dart:js_interop';

import 'package:cpay/items/TextFieldPreuse.dart';
import 'package:cpay/models/articles.dart';
import 'package:cpay/pages/details_article.dart';
import 'package:flutter/material.dart';

import '../items/cardArticle.dart';

class MesArticles extends StatefulWidget {
  const MesArticles({super.key});

  @override
  State<MesArticles> createState() => _MesArticlesState();
}

class _MesArticlesState extends State<MesArticles> {
  TextEditingController rechCOntrol = TextEditingController();
  Color couleurCpay = Color(0xFF6334A9);
  int listeArticlelength = articles.length;
  List<Article> afterRech = [];
  bool recherche = false;
  String motcle = '';
  rechercher() {
    setState(() {
      recherche = true;
    });
    afterRech.clear();
    motcle = rechCOntrol.text;
    for (int i = 0; i < articles.length; i++) {
      if (articles[i].titre == motcle) {
        afterRech.add(articles[i]);
      }
    }
    print(afterRech);
  }

  motvide() {
    setState(() {
      rechCOntrol.clear();
      rechCOntrol.clearComposing();
      recherche = false;
      print(recherche);
    });
  }

//hello
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          GridView.builder(
              itemCount: !recherche ? articles.length : afterRech.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.75),
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetaisArticle(
                                  article: !recherche
                                      ? articles[index]
                                      : afterRech[index]))),
                      child: cardArticle(
                        couleurCpay: couleurCpay,
                        article:
                            !recherche ? articles[index] : afterRech[index],
                      ),
                    ),
                  )),
          Align(
            alignment: Alignment(0, -0.95),
            child: barredeRecherche(context),
          ),
        ],
      ),
    ));
  }

  Widget barredeRecherche(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.grey,
          borderRadius: BorderRadius.circular(20)),
      height: 50,
      width: 400,
      child: TextFieldPreuse(
          hint: 'Rechercher',
          obscur: false,
          colorinside: const Color(0xFF6334A9).withOpacity(0.8),
          typeWord: TextInputType.text,
          sufixICO: !recherche
              ? IconButton(
                  onPressed: () {
                    rechercher();
                  },
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                )
              : IconButton(
                  onPressed: () {
                    motvide();
                  },
                  icon: const Icon(Icons.refresh),
                  color: Colors.white,
                ),
          control: rechCOntrol),
    );
  }
}
