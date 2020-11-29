import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/screens/events_bank_page.dart';
import 'package:scrappy/screens/loading_screen.dart';
import '../constants.dart';
const CCSE_hori_Logo='images/KSU_on light backgrounds/KSU_SVG LOGO/BE_Horiz_2Clr_Computing and Software.svg';
class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Scrappy Log-In Page'),
        ),
        body:
        Container(
          // decoration: BoxDecoration(image: DecorationImage(
          //   image: AssetImage("images/owl_wink.jpg"), fit: BoxFit.fill)
          // ),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Scrappy',
                      style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 40,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold ),
                    ),
                  ),
                  SizedBox(height: 20,
                    width: 150.0,
                    child: Divider(
                      color: Colors.teal.shade100,
                    ),
                  ),
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('images/owl_wink.jpg') ,
                  ),
                  Center(
                    child: Text(
                      'Welcome, Player 1 ',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black87),
                    ),
                  ),
                ],
              )
          ),
        )
    );
  }
}
