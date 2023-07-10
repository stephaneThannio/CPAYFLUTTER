import 'package:flutter/material.dart';

class Article extends StatefulWidget {
  const Article({super.key});

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              // ignore: sort_child_properties_last
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(0.96, -0.1),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF6334A9),
                          borderRadius: BorderRadius.circular(50)),
                      height: 50,
                      width: 50,
                      child: const Align(
                        alignment: Alignment(0, 0),
                        child: Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(-0.9, 0.8),
                    child: Container(
                      height: 50,
                      width: 100,
                      //container du texte articles
                      //color: Colors.green,
                      child: Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Articles:',
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 10.0,
                                offset: Offset(0, 4),
                              ),
                            ],
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              height: 150,
              width: 600,
              //container en rouge de barre en haut
              //color: Colors.red,
            ),
            Container(
              height: 520,
              width: 420,
              //container misy ny fitambarany liste ilay ampovoany
              //color: Colors.blue,
              child: DefaultTabController(
                length: 3,
                child: Builder(
                  builder: (BuildContext context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          child: TabBarView(
                            children: <Widget>[
                              Container(
                                //container en vert Premier tab
                                //color: Colors.green,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    //==================================
                                    Container(
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "lib/photos/img1.png")),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 150,
                                      width: 600,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment(-1, 0.4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                              ),
                                              height: 50,
                                              width: 400,
                                              child: Text(
                                                textAlign: TextAlign.left,
                                                'AnonymeFrançoise Barbe-Gall',
                                                style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                      blurRadius: 10.0,
                                                      offset: Offset(0, 4),
                                                    ),
                                                  ],
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontFamily: 'PlusJakartaSans',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(-1, 1),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20))),
                                              height: 50,
                                              width: 400,
                                              child: Text(
                                                textAlign: TextAlign.left,
                                                'Cours du soir - Comment regarder un tableau',
                                                style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                      blurRadius: 10.0,
                                                      offset: Offset(0, 4),
                                                    ),
                                                  ],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white,
                                                  fontFamily: 'PlusJakartaSans',
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //====================================
                                    Container(
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "lib/photos/img2.png")),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 150,
                                      width: 600,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment(-1, 0.4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                              ),
                                              height: 50,
                                              width: 400,
                                              child: Text(
                                                textAlign: TextAlign.left,
                                                'Alain Frachon et Benjamin Barthe',
                                                style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                      blurRadius: 10.0,
                                                      offset: Offset(0, 4),
                                                    ),
                                                  ],
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontFamily: 'PlusJakartaSans',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(-1, 1),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20))),
                                              height: 50,
                                              width: 400,
                                              child: Text(
                                                textAlign: TextAlign.left,
                                                'Chaleur humaine en public - Réchauffement climatique : la France est-elle prête ?',
                                                style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                      blurRadius: 10.0,
                                                      offset: Offset(0, 4),
                                                    ),
                                                  ],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white,
                                                  fontFamily: 'PlusJakartaSans',
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //=========================================
                                    Container(
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "lib/photos/img3.png")),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 150,
                                      width: 600,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment(-1, 0.4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                              ),
                                              height: 50,
                                              width: 400,
                                              child: Text(
                                                textAlign: TextAlign.left,
                                                'Alain Frachon et Benjamin Barthe',
                                                style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                      blurRadius: 10.0,
                                                      offset: Offset(0, 4),
                                                    ),
                                                  ],
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontFamily: 'PlusJakartaSans',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(-1, 1),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20))),
                                              height: 50,
                                              width: 400,
                                              child: Text(
                                                textAlign: TextAlign.left,
                                                'Cours du soir géopolitique : Le Moyen-Orient contemporain',
                                                style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                      blurRadius: 10.0,
                                                      offset: Offset(0, 4),
                                                    ),
                                                  ],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white,
                                                  fontFamily: 'PlusJakartaSans',
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.orange,
                              ),
                              Container(
                                color: Colors.blueGrey,
                              )
                            ],
                          ),
                        )),
                        //const TabPageSelector(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
