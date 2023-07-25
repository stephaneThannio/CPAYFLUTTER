import 'package:cpay/models/articles.dart';
import 'package:flutter/material.dart';

class DetaisArticle extends StatefulWidget {
  const DetaisArticle({super.key, required this.article});
  final Article article;
  @override
  State<DetaisArticle> createState() => _DetaisArticleState();
}

class _DetaisArticleState extends State<DetaisArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details du produits"),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(widget.article.image)),
              //color: Colors.green,
            ),
            height: 400,
          ),
          Container(
            //color: Colors.amber,
            height: 200,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(-1, -1),
                  child: Container(
                    //color: Colors.green,
                    height: 50,
                    width: 250,
                    child: Align(
                      alignment: Alignment(-1, -1),
                      child: Text(
                        textAlign: TextAlign.center,
                        widget.article.titre,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(1, -1),
                  child: Container(
                    //color: Colors.red,
                    height: 50,
                    width: 160,
                    child: Align(
                      alignment: Alignment(-1, -1),
                      child: Text(
                        textAlign: TextAlign.center,
                        widget.article.prix,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-1, -0.2),
                  child: Container(
                    //color: Colors.orange,
                    height: 70,
                    width: 150,
                    child: Stack(
                      children: [
                        const Align(
                          alignment: Alignment(0, -1),
                          child: Text(
                            textAlign: TextAlign.center,
                            'tickets',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(1, 0),
                          child: SizedBox(
                            width: 60,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                child: const Text(
                                  textAlign: TextAlign.center,
                                  '+',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                                onPressed: () => {}),
                          ),
                        ),
                        const Align(
                          alignment: Alignment(0, 0),
                          child: SizedBox(
                            width: 60,
                            height: 50,
                            child: Text(
                              textAlign: TextAlign.center,
                              '1',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-1, 0),
                          child: SizedBox(
                            width: 60,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                child: const Text(
                                  textAlign: TextAlign.center,
                                  '-',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                                onPressed: () => {}),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                height: 60,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Enregistrer',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                            Icon(
                              Icons.save_alt,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    ),
                    onPressed: () => {}),
              ),
              SizedBox(
                width: 200,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6334A9)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Acheter',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                            Icon(
                              Icons.shopping_cart_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    ),
                    onPressed: () => {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
