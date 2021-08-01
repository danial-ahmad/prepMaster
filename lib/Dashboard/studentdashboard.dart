import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prepmaster/Courses/coursedashboard.dart';
import 'package:prepmaster/Dashboard/categoriesModel.dart';
import 'package:prepmaster/Dashboard/newsModal.dart';
import 'package:prepmaster/LoginAndRegistration/Login.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard>
    with SingleTickerProviderStateMixin {
  List<Categories> list = List();
  List<News> listnews = List();
  var isLoading = false;

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
    _fetchData();
    _fetchnewsData();
  }

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("http://192.168.43.28/prepmasterapi/getdata.php");
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Categories.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load courses');
    }
  }

  _fetchnewsData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("http://192.168.43.28/prepmasterapi/getnews.php");
    if (response.statusCode == 200) {
      listnews = (json.decode(response.body) as List)
          .map((data) => new News.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Widget courses() {
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
                    "Courses List",
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
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CourseDashboard(
                                          list[index].id.toString(),
                                          list[index].coursetitle)))
                            },
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
                                            Icons.bookmark,
                                            size: 30,
                                            color: Colors.blue,
                                          ),
                                          Text(list[index].coursetitle,
                                              style: TextStyle(
                                                  color: Colors.blue[800],
                                                  fontSize: 30)),
                                        ],
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
          );
  }

  Widget news() {
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
                    "Latest News",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: listnews.length,
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
                                            Icons.notifications,
                                            size: 30,
                                            color: Colors.blue,
                                          ),
                                          Expanded(
                                            child: Text(
                                                listnews[index].headline,
                                                style: TextStyle(
                                                    color: Colors.blue[800],
                                                    fontSize: 30)),
                                          ),
                                        ],
                                      ),
                                      Divider(color: Colors.black),
                                      Text(listnews[index].news_detail,
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontSize: 20)),
                                      Divider(color: Colors.black),
                                      Text(listnews[index].datetime,
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontSize: 10)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Student Dashboard"),
        actions: <Widget>[
          FlatButton(
              onPressed: () => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()))
                  },
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ))
        ],
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.white,
          tabs: [
            new Tab(text: "Courses", icon: new Icon(Icons.notifications)),
            new Tab(
              text: "News",
              icon: new Icon(Icons.chat),
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [courses(), news()],
        controller: _tabController,
      ),
    );
  }
}
