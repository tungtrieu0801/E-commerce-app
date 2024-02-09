import 'package:ecommerceapp/admin/admin_home.dart';
import 'package:ecommerceapp/admin/admin_login.dart';
import 'package:ecommerceapp/pages/bottom_navigation.dart';
import 'package:ecommerceapp/pages/home.dart';
import 'package:ecommerceapp/pages/login.dart';
import 'package:ecommerceapp/pages/onboard.dart';
import 'package:ecommerceapp/pages/signup.dart';
import 'package:ecommerceapp/widget/app_constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publickey;

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: BottomNav(),
    );
  }
}
