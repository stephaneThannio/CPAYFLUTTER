// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'pages/Accueil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
      const duration = Duration(milliseconds: 200);
      final position = details.localPosition;
      final pressProgress = position.dy.clamp(0, 100);
      final adjustedDuration = duration * (1 - pressProgress);
      if (adjustedDuration > Duration.zero) {
        _animationController.duration = adjustedDuration;
        _animationController.forward();
      }
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
      _animationController.reverse();
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
      _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment(0.5, 0),
                    image: AssetImage("lib/photos/cpay_home.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            child: DefaultTabController(
              length: 3,
              child: Builder(
                builder: (BuildContext context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: TabBarView(children: <Widget>[
                            Container(
                              // color: Colors.red,
                              child: Align(
                                alignment: const Alignment(-1, -0.8),
                                child: SizedBox(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'c-Pay un moyen simple de paiement Anonyme',
                                    style: TextStyle(
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.8),
                                          blurRadius: 10.0,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'PlusJakartaSans',
                                    ),
                                  ),
                                  //color: Colors.greenAccent,
                                  height: 150,
                                  width: 200,
                                ),
                              ),
                            ),
                            Container(
                              // color: Colors.blue,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      alignment: Alignment(0.1, 0),
                                      image:
                                          AssetImage("lib/photos/page2-1.jpg"),
                                      fit: BoxFit.cover)),

                              // child: Stack(
                              //   children: [
                              //     //Image.asset(name),
                              //   ],
                              // ),
                              child: Align(
                                alignment: const Alignment(0, 1),
                                child: Container(
                                  decoration: BoxDecoration(
                                    //color: Colors.black.withOpacity(0.1),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        //offset: Offset(0, 4),
                                        blurRadius: 20,
                                      ),
                                    ],
                                  ),
                                  height: 200,
                                  width: 400,
                                  child: Align(
                                    alignment: const Alignment(0, 0),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Protegez vous des voleurs',
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            blurRadius: 10.0,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'PlusJakartaSans',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              //color: Colors.green,
                              child: Stack(
                                children: [
                                  Align(
                                      alignment: const Alignment(0, 0.95),
                                      child: GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Accueil())),
                                        onTapDown: _handleTapDown,
                                        onTapUp: _handleTapUp,
                                        onTapCancel: _handleTapCancel,
                                        child: ScaleTransition(
                                          scale: _scaleAnimation,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: _isPressed
                                                        ? Colors.black
                                                            .withOpacity(0.5)
                                                        : Colors.black,
                                                    blurRadius: 10.0,
                                                    spreadRadius: 2.0,
                                                    offset: const Offset(0, 6),
                                                  ),
                                                ],
                                                color: const Color(0xFF6334A9),
                                                borderRadius:
                                                    BorderRadius.circular(69)),
                                            child: Align(
                                              alignment:
                                                  const Alignment(0, -0.20),
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                'Commencer',
                                                style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                      color: Colors.black
                                                          .withOpacity(0.2),
                                                      blurRadius: 10.0,
                                                      offset:
                                                          const Offset(0, 2),
                                                    ),
                                                  ],
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontFamily: 'PlusJakartaSans',
                                                ),
                                              ),
                                            ),
                                            height: 60,
                                            width: 200,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ]),
                          //color: Colors.red,
                        ),
                        //   child: IconTheme(
                        // data: IconThemeData(
                        //   size: 128.0,
                        //   color: Theme.of(context).colorScheme.secondary,
                        // ),
                        // child: const TabBarView(children: kicons),
                      ),
                      const TabPageSelector(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: null,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
