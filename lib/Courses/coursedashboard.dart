import 'package:flutter/material.dart';
import 'package:prepmaster/Courses/lecturevideos.dart';
import 'package:prepmaster/Courses/pastpaper.dart';
import 'package:prepmaster/Courses/practicequiz.dart';

class CourseDashboard extends StatefulWidget {
  final String coursename;
  final String courseid;
  CourseDashboard(this.courseid, this.coursename);
  @override
  _CourseDashboardState createState() => _CourseDashboardState();
}

class _CourseDashboardState extends State<CourseDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.green],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(height: 50.0),
              Text(
                this.widget.coursename.toUpperCase(),
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: CustomScrollView(
                  shrinkWrap: false,
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.all(35),
                      sliver: SliverGrid.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (Context) =>
                                          Pastpapers(this.widget.coursename)));
                            },
                            child: Card(
                              elevation: 9.0,
                              color: Colors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/pp.png',
                                      width: 70,
                                      height: 70,
                                    ),
                                    Text('Past Papers',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LectureVideos(
                                          this.widget.coursename)));
                            },
                            child: Card(
                              elevation: 9.0,
                              color: Colors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/lecture.png',
                                        width: 70,
                                        height: 70,
                                      ),
                                      Center(
                                          child: Text('Video lecture',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold)))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LectureVideos(
                                          this.widget.coursename)));
                            },
                            child: Card(
                              elevation: 9.0,
                              color: Colors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/pencil.png',
                                        width: 70,
                                        height: 70,
                                      ),
                                      Center(
                                          child: Text('Practice',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold)))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PracticeQuiz()));
                            },
                            child: Card(
                              elevation: 9.0,
                              color: Colors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/query.png',
                                        width: 70,
                                        height: 70,
                                      ),
                                      Center(
                                          child: Text('Queries',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold)))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
