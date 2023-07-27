import 'package:cpay/models/articles.dart';
import 'package:flutter/material.dart';

class DetaisArticle extends StatefulWidget {
  const DetaisArticle({super.key, required this.article});
  final Article article;
  @override
  State<DetaisArticle> createState() => _DetaisArticleState();
}

class _DetaisArticleState extends State<DetaisArticle> {
  int ticketsNumber = 0;
  plusTickets() {
    setState(() {
      ticketsNumber = ticketsNumber + 1;
    });
  }

  lesTickets() {
    if (ticketsNumber > 0) {
      setState(() {
        ticketsNumber = ticketsNumber - 1;
      });
    } else {
      setState(() {
        ticketsNumber = ticketsNumber - 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details du produits"),
        ),
        body: Column(
          children: [
            Container(
              //color: Colors.green,
              height: 400,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.article.image)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              //color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xFF6334A9),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Text(
                      textAlign: TextAlign.center,
                      'Dispo',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.orange,
                    child: const Text(
                      textAlign: TextAlign.center,
                      'Tirage dans:',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 30),
                    //color: Colors.green,
                    child: Text(
                      textAlign: TextAlign.start,
                      widget.article.titre,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PlusJakartaSans',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                    //color: Colors.orange,
                    margin: EdgeInsets.only(right: 30),
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: const Color(0xFF6334A9).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.timer_sharp,
                            color: Colors.black,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            '4j',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                //color: Colors.indigo,
                child: const Text(
                  textAlign: TextAlign.start,
                  "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 160,
                  margin: EdgeInsets.only(left: 30),
                  //color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
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
                          onPressed: () => {lesTickets()}),
                      Text(
                        textAlign: TextAlign.center,
                        ticketsNumber.toString(),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                      ElevatedButton(
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
                          onPressed: () => {plusTickets()}),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: Container(
                    margin: EdgeInsets.only(right: 30),
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
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}
