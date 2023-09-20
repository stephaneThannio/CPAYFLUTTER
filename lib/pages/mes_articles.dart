//import 'dart:js_interop';

// ignore_for_file: avoid_print

import 'package:cpay/api/api.dart';
import 'package:cpay/items/barre_rechrche.dart';
import 'package:cpay/items/categories.dart';
//import 'package:cpay/items/itemcategories.dart';
//import 'package:cpay/items/loading.dart';
import 'package:cpay/items/loadinglistview.dart';
import 'package:cpay/items/loadingsimple.dart';

import 'package:cpay/models/articles.dart';
import 'package:cpay/pages/details_article.dart';
//import 'package:cpay/pages/details_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
  List articles = [];
  bool loading = false;
  bool listchargement = false;
  int scrollmaxcount = 0;
  //int listeArticlelength = articles.length;
  List<Article> afterRech = [];
  List listCategories = [];
  bool recherche = false;
  bool categrorie = false;
  //String text='';
  String motcle = '';
  int page = 1;
  int totalpage = 0;
  ScrollController onScrollmax = ScrollController();
  affichCategries() {
    setState(() {
      categrorie = !categrorie;
    });
  }

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

  // Future getarticle() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   try {
  //     var arttemp = await Api.getarticle(1);
  //     print(arttemp["total_page"]);
  //     totalpage = arttemp["total_page"];
  //     if (arttemp != {}) {
  //       for (int i = 0; i < arttemp['mdata'].length; i++) {
  //         articles.add(arttemp['mdata'][i]);
  //       }
  //       setState(() {
  //         loading = false;
  //         page = page + 1;
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future getCategories() async {
    var mapcategories = await Api.getcategories();
    if (mapcategories != {}) {
      for (int i = 0; i < mapcategories['mdata'].length; i++) {
        listCategories.add(mapcategories['mdata'][i]);
      }
    }
  }

  Future searchbycategories() async {
    print('hello');
    articles.clear();
    setState(() {
      loading = true;
      categrorie = false;
    });
    // setState(() {
    //     categrorie = false;
    //   });
    try {
      var arttemp = await Api.getarticlebycategories(
          Categoris.filtre, page, BarreRech.text);
      print(arttemp["total_page"]);
      totalpage = arttemp["total_page"];
      if (arttemp != {}) {
        for (int i = 0; i < arttemp['mdata'].length; i++) {
          articles.add(arttemp['mdata'][i]);
        }
        //print(articles);
        setState(() {
          loading = false;

          page = page + 1;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  essai() {
    //print("hello");
    print(Categoris.filtre);
    setState(() {
      categrorie = false;
    });
  }

  // Future searchbycategories() async {
  //   var mapcategories = await Api.getarticlebycategories(Categoris.filtre);
  //   if (mapcategories != {}) {
  //     for (int i = 0; i < mapcategories['mdata'].length; i++) {
  //       listCategories.add(mapcategories['mdata'][i]);
  //     }
  //     setState(() {
  //       categrorie = false;
  //     });
  //   }
  // }

  Future onScrollend() async {
    // List scrolListtmep = [];
    if (onScrollmax.position.pixels == onScrollmax.position.maxScrollExtent) {
      scrollmaxcount = scrollmaxcount + 1;

      if (scrollmaxcount == 1) {
        print(scrollmaxcount);
        if (page <= totalpage) {
          setState(() {
            listchargement = true;
          });
          var scrolListtmep = await Api.getarticlebycategories(
              Categoris.filtre, page, BarreRech.text);
          for (int i = 0; i < scrolListtmep["mdata"].length; i++) {
            articles.add(scrolListtmep["mdata"][i]);
          }
          setState(() {
            page = page + 1;
            listchargement = false;
            scrollmaxcount = 0;
          });
        }
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    searchbycategories();
    //getarticle();
    getCategories();
    onScrollmax.addListener(onScrollend);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    onScrollmax.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10.sp,
              ),
              //barredeRecherche(context),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: BarreRech(
                  context: context,
                  affichCategries: () => affichCategries(),
                  onchangedtext: () {
                    page = 1;
                    searchbycategories();
                    //print(BarreRech.text);
                  },
                ),
              ),
              loading
                  ? const Expanded(
                      child: Loading(
                        spincouleur: Color(0xFF6334A9),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                          controller: onScrollmax,
                          itemCount:
                              !recherche ? articles.length : afterRech.length,
                          itemBuilder: (context, index) => Padding(
                              padding:
                                  EdgeInsets.only(right: 7.0.w, left: 7.0.w),
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetaisArticle(
                                          id: articles[index]['id'],
                                          id_categorie: articles[index]
                                              ['id_categorie'],
                                          categorie: articles[index]
                                              ['categorie'],
                                          photos: articles[index]['photos'],
                                          designation: articles[index]
                                              ['designation'],
                                          prix_ticket: articles[index]
                                              ['prix_ticket'],
                                          reference: articles[index]
                                              ['reference'],
                                          pourcentage: articles[index]
                                              ['pourcentage'],
                                          date_tirage: articles[index]
                                              ['date_tirage']),
                                    )),
                                child: SizedBox(
                                  height: 180.spMax,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, bottom: 5),
                                    child: CardArticle(
                                        couleurCpay: couleurCpay,
                                        id: articles[index]['id'],
                                        id_categorie: articles[index]
                                            ['id_categorie'],
                                        categorie: articles[index]['categorie'],
                                        photos: articles[index]['photos'],
                                        designation: articles[index]
                                            ['designation'],
                                        prix_ticket: articles[index]
                                            ['prix_ticket'],
                                        reference: articles[index]['reference'],
                                        pourcentage: articles[index]
                                            ['pourcentage'],
                                        date_tirage: articles[index]
                                            ['date_tirage']),
                                    // child: CardArticle(
                                    //   couleurCpay: couleurCpay,
                                    //   article:
                                    //       !recherche ? articles[index] : afterRech[index],
                                    // ),
                                  ),
                                ),
                                //),
                              ))),
                    ),
              Visibility(
                visible: listchargement,
                child: const SizedBox(
                  height: 20,
                  child: LoadingLisview(),
                ),
              )
              //const LoadingLisview(),
            ],
          ),
          Visibility(
            visible: categrorie,
            child: Align(
              alignment: const Alignment(0, -0.65),
              child: Categoris(
                listcat: listCategories,
                fuctionannuler: () {
                  setState(() {
                    categrorie = false;
                  });
                },
                dosearch: () {
                  //essai();
                  page = 1;
                  searchbycategories();
                },
                // dosearch: searchbycategories(),
              ).animate().fade(),
            ),
          )
        ],
      ),
    ));
  }
}
