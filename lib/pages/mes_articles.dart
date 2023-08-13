//import 'dart:js_interop';

// ignore_for_file: avoid_print

import 'package:cpay/items/TextFieldPreuse.dart';
import 'package:cpay/models/articles.dart';
import 'package:cpay/pages/details_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../items/cardArticle.dart';

class MesArticles extends StatefulWidget {
  const MesArticles({super.key});

  @override
  State<MesArticles> createState() => _MesArticlesState();
}

class _MesArticlesState extends State<MesArticles> {
  TextEditingController rechCOntrol = TextEditingController();
  Color couleurCpay = const Color(0xFF6334A9);
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
      child: Column(
        children: [
          barredeRecherche(context),
          Expanded(
            child: ListView.builder(
                itemCount: !recherche ? articles.length : afterRech.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(right: 7.0.w, left: 7.0.w),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetaisArticle(
                                    article: !recherche
                                        ? articles[index]
                                        : afterRech[index]))),
                        child: SizedBox(
                          height: 160.spMax,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                            child: CardArticle(
                              couleurCpay: couleurCpay,
                              article: !recherche
                                  ? articles[index]
                                  : afterRech[index],
                            ),
                          ),
                        ),
                      ),
                    )),
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
      height: 40.sp,
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
                  icon: Icon(
                    Icons.search,
                    size: 20.sp,
                  ),
                  color: Colors.white,
                )
              : IconButton(
                  onPressed: () {
                    motvide();
                  },
                  icon: Icon(
                    Icons.refresh,
                    size: 20.sp,
                  ),
                  color: Colors.white,
                ),
          control: rechCOntrol),
    );
  }
}
