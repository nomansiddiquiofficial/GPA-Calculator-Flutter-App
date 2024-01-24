import 'package:flutter/material.dart';

class GPA_Table extends StatelessWidget {
  const GPA_Table({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GPA Table"),
        backgroundColor: Color(0xFF001d3d),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
                  height: 300,
                  width: 300,
                  child: Image.asset("assets/gpaTable.PNG"))),
        ],
      ),
    );
  }
}
