import 'package:flutter/material.dart';

class GPA_Calc extends StatefulWidget {
  const GPA_Calc({super.key});

  @override
  State<GPA_Calc> createState() => _GPA_CalcState();
}

class _GPA_CalcState extends State<GPA_Calc> {
  TextEditingController courses_lenght = TextEditingController();
  List<Widget> textInputFields = [];

  List<TextEditingController> textInputController = [];
  String displayDialog = '';
  double displayGpa = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Gᑭᗩ ᑕᗩᒪᑕᑌᒪᗩTE",
          ),
          centerTitle: false,
          backgroundColor: Color(0xFF001d3d),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Container(
                height: 400,
                child: Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Text(
                              "𝕰𝖓𝖙𝖊𝖗 𝖓𝖔. 𝖔𝖋 𝕮𝖔𝖚𝖗𝖘𝖊𝖘",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 25),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 70,
                              width: 160,
                              child: TextField(
                                controller: courses_lenght,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    hintText: "e.g: 6,7",
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const SizedBox(height: 1),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF003566)),
                              child: const Text("Submit"),
                              onPressed: () {
                                setState(() {
                                  if (courses_lenght.text == '' ||
                                      int.parse(courses_lenght.text) == 0) {
                                    textInputFields.clear();
                                    textInputController.clear();
                                  } else {
                                    textInputController.clear();
                                    textInputFields.clear();

                                    for (int i = 0;
                                        i <= int.parse(courses_lenght.text) - 1;
                                        i++) {
                                      TextEditingController controller =
                                          TextEditingController();
                                      textInputController.add(controller);
                                      textInputFields.add(Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 50,
                                          width: 150,
                                          child: TextField(
                                            controller: controller,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                labelText:
                                                    "Course: ${i + 1} No.",
                                                border:
                                                    const OutlineInputBorder()),
                                          ),
                                        ),
                                      ));
                                    }
                                  }
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ...textInputFields,
                                SizedBox(
                                  height: 12,
                                ),
                                courses_lenght.text == '' ||
                                        int.parse(courses_lenght.text) == 0
                                    ? const Text("")
                                    : SizedBox(
                                        height: 50,
                                        width: 100,
                                        child: FloatingActionButton.extended(
                                            onPressed: () {
                                              double getResult = gpaCalc();
                                              if (getResult == 1000.0) {
                                                displayDialog =
                                                    "Please! Fill all the above fields";
                                                _showDialog();
                                              } else {
                                                setState(() {
                                                  displayGpa = gpaCalc();
                                                });
                                              }
                                            },
                                            label: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: const Text("All Done"),
                                            ),
                                            icon: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 9),
                                              child:
                                                  Icon(Icons.check, size: 20),
                                            ),
                                            backgroundColor: Color(0xFF14213d)),
                                      ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text("CGPA:"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                          height: 60,
                          width: 80,
                          color: Color(0xFF003566),
                          child: Center(
                              child: Text(
                            displayGpa.toStringAsFixed(2),
                            style: TextStyle(color: Colors.white),
                          ))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        height: 30,
                        width: 30,
                        child: FloatingActionButton(
                          child: Icon(
                            Icons.restart_alt,
                            size: 20,
                            color: Color(0xFF14213d),
                          ),
                          onPressed: () {
                            setState(() {
                              displayGpa = 0;
                            });
                            textInputFields = [];
                            courses_lenght.clear();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  double gpaCalc() {
    double totalGrade = 0.0;
    bool allFieldsFilled = true;
    if (textInputController.length == int.parse(courses_lenght.text)) {
      for (int i = 0; i < textInputFields.length; i++) {
        String textGrade = textInputController[i].text.trim();
        if (textGrade.isEmpty) {
          allFieldsFilled = false;
          break; // Exit the loop if any field is empty
        }
        double grade = double.parse(textGrade);

        if (grade >= 90) {
          totalGrade += 4.0;
        } else if (grade >= 85 && grade <= 89) {
          totalGrade += 4.0;
        } else if (grade >= 80 && grade <= 84) {
          totalGrade += 3.8;
        } else if (grade >= 75 && grade <= 79) {
          totalGrade += 3.4;
        } else if (grade >= 71 && grade <= 74) {
          totalGrade += 3.0;
        } else if (grade >= 68 && grade <= 70) {
          totalGrade += 2.8;
        } else if (grade >= 64 && grade <= 67) {
          totalGrade += 2.4;
        } else if (grade >= 61 && grade <= 63) {
          totalGrade += 2.0;
        } else if (grade >= 57 && grade <= 60) {
          totalGrade += 1.8;
        } else if (grade >= 53 && grade <= 56) {
          totalGrade += 1.4;
        } else if (grade >= 50 && grade <= 52) {
          totalGrade += 1.0;
        } else if (grade < 50) {
          totalGrade += 0.0;
        }
      }

      if (allFieldsFilled == true) {
        // Calculate the average GPA
        double averageGPA = totalGrade / textInputFields.length;
        return averageGPA;
      } else {
        return 1000.0;
      }
    }

    return 0.0;
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(displayDialog),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
