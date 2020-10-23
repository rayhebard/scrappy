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
                 // Center(
                 //   child: new Image.asset(
                 //     'images/owl_wink.jpg',
                 //     fit: BoxFit.fill,
                 //   ),
                 // ),
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
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: nameController,
                      style: TextStyle(color: kCardColor),
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey, width: 3.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 3.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      style: TextStyle(color: kCardColor),
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey, width: 3.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 3.0),
                        ),
                      ),
                    ),
                  ),
                  Container(

                      height: 70,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.amberAccent.shade100,
                        color: kCardColor,
                        child: Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                        ),

                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context){
                                return LoadingScreen();
                              }
                              )
                          );
                          print(nameController.text);
                          print(passwordController.text);
                        },
                      )),
                  Container(
                      height: 70,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child:
                          FlatButton(
                            textColor: Colors.amber,
                            color: Colors.grey,
                            child: Text(
                              'Continue as Guest ->',
                              style: TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context){
                                    return LoadingScreen();
                                  }
                                  )
                              );
                            },
                          )
                      )
                ],
              )
          ),
        )
    );
  }
}
