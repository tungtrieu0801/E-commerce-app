import 'package:ecommerceapp/pages/bottom_navigation.dart';
import 'package:ecommerceapp/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/widget_support.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar((SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Register Successfully",
            style: TextStyle(fontSize: 20),
          ),
        )));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            content: Text(
              "Password provider is too weak",
              style: TextStyle(fontSize: 18),
            ),
          )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Account already in use, try",
              style: TextStyle(fontSize: 18),
            ),
          )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFff5c30),
                    Color(0xFFe74b1a),
                  ],
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'images/logo.png',
                      width: MediaQuery.of(context).size.width / 1.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Sign Up",
                              style: AppWidget.headlineTextFieldStyle(),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            TextFormField(
                              controller: namecontroller,
                              validator: (value){
                                if (value==null||value.isEmpty){
                                  return 'Please enter Name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Name',
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: emailcontroller,
                              validator: (value){
                                if (value==null||value.isEmpty){
                                  return 'Please enter Email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter email',
                                prefixIcon: Icon(Icons.mail),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordcontroller,
                              validator: (value){
                                if (value==null||value.isEmpty){
                                  return 'Please enter Password';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Enter password',
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            GestureDetector(
                              onTap: () async {
                                if(_formkey.currentState!.validate()){
                                  setState(() {
                                    email = emailcontroller.text;
                                    name = namecontroller.text;
                                    password = passwordcontroller.text;
                                  });
                                }
                                registration();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Color(0Xffff5722),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Already have account? Login",
                        style: AppWidget.boldTextFieldStyle(),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
