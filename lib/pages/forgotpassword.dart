import 'package:ecommerceapp/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mailController = new TextEditingController();

  String email="";
  final _formkey = GlobalKey<FormState>();
  resetPassword () async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password have been reset", style: TextStyle(fontSize: 18),)));
    } on FirebaseAuthException catch (e) {
      if(e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found for that email")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Password recovery",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter your email",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Expanded(
                child: Form(
                  key: _formkey,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: mailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter the email";
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.white),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white70,
                            size: 30,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        if(_formkey.currentState!.validate()){
                          setState(() {
                            email = mailController.text;
                          });
                          resetPassword();
                        }
                      },
                      child: Container(
                        width: 140,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Send email",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("Don't have account?", style: TextStyle(fontSize: 18, color: Colors.white70),),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (contexy)=>Signup()));
                          },
                            child: Text("Create", style: TextStyle(color: Colors.red,fontSize: 20),)),
                      ],
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
