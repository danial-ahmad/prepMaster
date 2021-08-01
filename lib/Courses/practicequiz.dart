import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prepmaster/Courses/QuizModal.dart';
import 'package:http/http.dart' as http;

class PracticeQuiz extends StatefulWidget {
  @override
  _PracticeQuizState createState() => _PracticeQuizState();
}

class _PracticeQuizState extends State<PracticeQuiz> {
  @override
  bool isLoading = false;
  List<QuizList> listquiz = List();
  bool _showans = false;

  @override
  void initState() {
    super.initState();
    _fetchquizData();
  }

  _fetchquizData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("http://192.168.43.28/prepmasterapi/getquiz.php");
    if (response.statusCode == 200) {
      listquiz = (json.decode(response.body) as List)
          .map((data) => new QuizList.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load Quizes');
    }
  }

  Widget quiz() {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Practice Quiz",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: listquiz.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => {},
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Material(
                                elevation: 16,
                                borderRadius: BorderRadius.circular(24.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.question_answer,
                                            size: 20,
                                            color: Colors.blue,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(listquiz[index].que,
                                                style: TextStyle(
                                                    color: Colors.blue[800],
                                                    fontSize: 20)),
                                          ),
                                        ],
                                      ),
                                      Divider(color: Colors.black),
                                      Text("1.    " + listquiz[index].op1,
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontSize: 15)),
                                      Text("2.    " + listquiz[index].op2,
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontSize: 15)),
                                      Text("3.    " + listquiz[index].op3,
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontSize: 15)),
                                      Text("4.    " + listquiz[index].op4,
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontSize: 15)),
                                      Divider(color: Colors.black),
                                      Row(
                                        children: <Widget>[
                                          RaisedButton(
                                              onPressed: () {
                                                setState(() {
                                                  _showans = true;
                                                });
                                              },
                                              color: Colors.green,
                                              child: Text(
                                                "Show Answer",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Visibility(
                                            visible: _showans,
                                            child: Text(listquiz[index].ans,
                                                style: TextStyle(
                                                    color: Colors.blue[900],
                                                    fontSize: 15)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: quiz(),
    );
  }
}
