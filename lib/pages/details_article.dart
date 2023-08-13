import 'package:cpay/models/articles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          title: Text(
            "Details du produits",
            style: TextStyle(fontSize: 20.sp),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                size: 20.sp,
              )),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  //color: Colors.green,
                  height: 320.sp,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(widget.article.image)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.all(20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 28.sp, right: 28.sp),
                  //color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFF6334A9),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.sp, left: 8.sp),
                            child: Text(
                              textAlign: TextAlign.center,
                              'Dispo',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Tirage dans:',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontFamily: 'PlusJakartaSans',
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 30),
                        //color: Colors.green,
                        child: Text(
                          textAlign: TextAlign.start,
                          widget.article.titre,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PlusJakartaSans',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        //color: Colors.orange,
                        margin: const EdgeInsets.only(right: 30),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFF6334A9).withOpacity(0.6),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 30.sp,
                                right: 30.sp,
                                top: 5.sp,
                                bottom: 5.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  size: 23.sp,
                                  Icons.timer_sharp,
                                  color: Colors.black,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  '4j',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 30.sp, right: 30.sp, top: 10.sp),
                  //color: Colors.indigo,
                  child: SingleChildScrollView(
                    child: Text(
                      textAlign: TextAlign.start,
                      " olerm upsom it has no doubght to make mistqake inside the computer when you are in the bathroom It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: EdgeInsets.only(left: 30.sp),
                      //color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                '-',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                              onPressed: () => {lesTickets()}),
                          Text(
                            textAlign: TextAlign.center,
                            ticketsNumber.toString(),
                            style: TextStyle(
                              fontSize: 28.sp,
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
                              child: Text(
                                textAlign: TextAlign.center,
                                '+',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                              onPressed: () => {plusTickets()}),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6334A9)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  'Acheter',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                                Icon(
                                  size: 23.sp,
                                  Icons.shopping_cart_rounded,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                        onPressed: () => {}),
                  ],
                ),
                SizedBox(
                  height: 15.sp,
                ),
              ],
            ),
          ),
        ));
  }
}
