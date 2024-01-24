import 'dart:async';
import 'package:gpa/choicePage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ChoicePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 540,
              width: 380,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/ubit2.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Text(
                  '''              【 ＧＰＡ 】
  【 ＣＡＬＣＵＬＡＴＯＲ 】''',
                  style: TextStyle(
                    color: Color(0xFFf7ede2),
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
