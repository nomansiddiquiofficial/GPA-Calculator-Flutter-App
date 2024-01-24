import 'package:flutter/material.dart';
import 'package:gpa/gpaCalculatorPage.dart';
import 'package:gpa/gpaTablePage.dart';
//import 'package:gpa/splashPage.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GPA Calculator"),
        centerTitle: true,
        backgroundColor: Color(0xFF001d3d),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/ubit-transformed.jpeg"),
                fit: BoxFit.cover)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
              child: Text(
            "GPA CALCULATOR",
            style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w900,
                backgroundColor: Colors.black26),
          )),
          const SizedBox(
            height: 4,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GPA_Calc()));
              },
              child: const Text("Click here!"),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF003566)),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
              child: Text(
            "ミ★ GPA TABLE ★彡",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w900,
                backgroundColor: Colors.black38),
          )),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GPA_Table()));
                },
                child: const Text("Click to View GPA Table"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF003566))),
          ),
        ]),
      ),
    );
  }
}
