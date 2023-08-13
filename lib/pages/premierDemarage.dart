import 'package:cpay/pages/Accueil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Commencer extends StatefulWidget {
  const Commencer({super.key});

  @override
  State<Commencer> createState() => _CommencerState();
}

class _CommencerState extends State<Commencer>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool firstuses = false;
  var use;
  Future uses() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    firstuses = true;
    spref.setBool("usescase", firstuses);
    spref.commit();
  }

  Future ifuse() async {
    SharedPreferences ifuses = await SharedPreferences.getInstance();
    use = ifuses.getBool("usescase");
  }

  gotohome() {
    if (use == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Accueil()));
    } else {
      Navigator.of(context);
    }
  }

  void verifuse() {
    ifuse().whenComplete(() => gotohome());
  }

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
    verifuse();
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
    double screenheight = MediaQuery.of(context).size.height;
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
                builder: (BuildContext context) => Stack(
                  children: [
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: TabBarView(children: <Widget>[
                            Align(
                              alignment: const Alignment(-1, -0.8),
                              child: SizedBox(
                                height: 150.sp,
                                width: 200.sp,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'CPAY un moyen simple de paiement Anonyme',
                                  style: TextStyle(
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.8),
                                        blurRadius: 10.0,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
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
                                  height: 200.sp,
                                  width: 400.sp,
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
                                        fontSize: 40.sp,
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
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      alignment: Alignment(0.1, 0),
                                      image: AssetImage("lib/photos/page3.png"),
                                      fit: BoxFit.cover)),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: (screenheight * 0.5).sp,
                                  //color: Colors.red,
                                  margin: const EdgeInsets.only(bottom: 30),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          //color: Colors.black.withOpacity(0.1),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              //offset: Offset(0, 4),
                                              blurRadius: 20,
                                            ),
                                          ],
                                        ),
                                        height: 200.sp,
                                        width: 400.sp,
                                        child: Align(
                                          alignment: const Alignment(0, 0),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            'Un seul compte pour tout l\'argent du monde',
                                            style: TextStyle(
                                              shadows: [
                                                Shadow(
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  blurRadius: 10.0,
                                                  offset: const Offset(0, 4),
                                                ),
                                              ],
                                              fontSize: 40.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          uses();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Accueil()));
                                        },
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
                                            height: 60.h,
                                            width: 200.w,
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
                                                  fontSize: 24.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontFamily: 'PlusJakartaSans',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                    const Align(
                        alignment: Alignment(0, 1), child: TabPageSelector()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
