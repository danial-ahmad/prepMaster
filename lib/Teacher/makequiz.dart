import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class MakeQuiz extends StatefulWidget {
  @override
  _MakeQuizState createState() => _MakeQuizState();
}

class _MakeQuizState extends State<MakeQuiz> {
  bool _rememberMe = false;
  int _value = 1;
  bool visible;

  TextEditingController queController = new TextEditingController();
  TextEditingController op1Controller = new TextEditingController();
  TextEditingController op2Controller = new TextEditingController();
  TextEditingController op3Controller = new TextEditingController();
  TextEditingController op4Controller = new TextEditingController();
  TextEditingController ansController = new TextEditingController();

  Future userRegistration() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String que = queController.text;
    String op1 = op1Controller.text;
    String op2 = op2Controller.text;
    String op3 = op3Controller.text;
    String op4 = op4Controller.text;
    String ans = ansController.text;
    print(_value);
    // SERVER API URL
    var url = 'http://192.168.43.28/prepmasterapi/postquiz.php';

    String role;
    if (_value == 2) {
      role = "Teacher";
    } else if (_value == 3) {
      role = "Student";
    }
    // Store all data with Param Name.
    var data = {
      'que': que,
      'op1': op1,
      'op2': op2,
      'op3': op3,
      'op4': op4,
      'ans': ans
    };

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  queController.text = "";
                  op1Controller.text = "";
                  op2Controller.text = "";
                  op3Controller.text = "";
                  op4Controller.text = "";
                  ansController.text = "";
                });
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildqueTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Question',
          style: kLabelStyle,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: queController,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.question_answer,
                color: Colors.white,
              ),
              hintText: 'Enter Question',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildop1TF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Option 1',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: op1Controller,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.question_answer,
                color: Colors.white,
              ),
              hintText: 'Enter Option 1',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildop2TF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Option 2',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: op2Controller,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.question_answer,
                color: Colors.white,
              ),
              hintText: 'Enter Option 2',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildop3TF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Option 3',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: op3Controller,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.question_answer,
                color: Colors.white,
              ),
              hintText: 'Enter Option 3',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildop4TF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Option 4',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: op4Controller,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.question_answer,
                color: Colors.white,
              ),
              hintText: 'Enter Option 4',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildansTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Actual Answer',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: ansController,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.question_answer,
                color: Colors.white,
              ),
              hintText: 'Enter Actual Answer',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTypeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Type',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.blue.shade800),
            child: DropdownButtonFormField(
                value: _value,
                iconEnabledColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                ),
                elevation: 10,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  hintText: 'Enter your Password',
                  hintStyle: kHintTextStyle,
                ),
                items: [
                  DropdownMenuItem(
                    child: Text("Select Category"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Teacher"),
                    value: 2,
                  ),
                  DropdownMenuItem(child: Text("Student"), value: 3),
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => userRegistration(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Submit',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.green[800],
                      Color(0xFF398AE5),
                    ],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20.0,
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Make Quiz',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        _buildqueTF(),
                        SizedBox(height: 2.0),
                        _buildop1TF(),
                        SizedBox(height: 2.0),
                        _buildop2TF(),
                        SizedBox(height: 2.0),
                        _buildop3TF(),
                        SizedBox(height: 2.0),
                        _buildop4TF(),
                        SizedBox(height: 2.0),
                        _buildansTF(),
                        SizedBox(
                          height: 0.0,
                        ),
                        _buildLoginBtn(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
