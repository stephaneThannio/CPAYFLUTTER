import 'package:flutter/material.dart';
import 'Article.dart';

class encienBody extends StatelessWidget {
  const encienBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    color: Colors.green,
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
            color: Colors.red,
          ),
          Container(
            height: 520,
            width: 420,
            //container misy ny fitambarany liste ilay ampovoany
            color: Colors.blue,
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
                            const listdesArticles(),
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
    );
  }
}
