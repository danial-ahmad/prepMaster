import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class MakeEssay extends StatefulWidget {
  final String cat;
  MakeEssay(this.cat);
  @override
  _MakeEssayState createState() => _MakeEssayState();
}

class _MakeEssayState extends State<MakeEssay> {
  int _value = 1;
  bool visible;
  TextEditingController essayController = new TextEditingController();

  Future makeQuiz() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String essay = essayController.text;
    String cat = this.widget.cat;

    print(_value);
    // SERVER API URL
    var url = 'http://192.168.43.28/prepmasterapi/postessay.php';

    // Store all data with Param Name.
    var data = {
      'essay': essay,
      'cat':cat
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
                  essayController.text = "";
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
          'Essay',
          style: kLabelStyle,
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.topLeft,
          decoration: kBoxDecorationStyle,
          height: 400.0,
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: essayController,
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
              hintText: 'Enter Essay',
              hintStyle: kHintTextStyle,
            ),
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
        onPressed: () => makeQuiz(),
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
                          'Make Essay',
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
