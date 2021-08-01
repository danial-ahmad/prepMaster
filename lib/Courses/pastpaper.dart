import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prepmaster/Courses/coursedashboard.dart';
import 'package:prepmaster/Courses/pastpapermodel.dart';
import 'package:prepmaster/Dashboard/categoriesModel.dart';

class Pastpapers extends StatefulWidget {
  final String coursetype;
  Pastpapers(this.coursetype);
  @override
  _PastpapersState createState() => _PastpapersState();
}

class _PastpapersState extends State<Pastpapers> {
  List<PastPaper> list = List();
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    var data = {'course_type': this.widget.coursetype};

    final response = await http.post(
        "http://192.168.43.28/prepmasterapi/getpastpaper.php",
        body: json.encode(data));
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new PastPaper.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load courses');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
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
                        "PastPaper List",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: list.length,
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
                                          Image.network(
                                            list[index].imgurl,
                                            fit: BoxFit.fill,
                                          ),
                                          Divider(color: Colors.black),
                                          Text(list[index].description,
                                              style: TextStyle(
                                                  color: Colors.blue[900],
                                                  fontSize: 20)),
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
              ));
  }
}
