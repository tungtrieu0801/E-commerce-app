import 'dart:math';

import 'package:ecommerceapp/pages/detail.dart';
import 'package:ecommerceapp/widget/widget_support.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool icecream = false, salad = false, pizza = false, burger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50.0, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hello Tung, ',
                  style: AppWidget.boldTextFieldStyle(),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Delicious Food',
              style: AppWidget.headlineTextFieldStyle(),
            ),
            Text(
              'Discover and Get great Food',
              style: AppWidget.lightTextFieldStyle(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(margin: EdgeInsets.only(right: 20),child: showItem()),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Details()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'images/salad2.png',
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "Vegetable",
                                style: AppWidget.boldTextFieldStyle(),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "Fresh and healthy",
                                style: AppWidget.lightTextFieldStyle(),
                              ),
                              Text("\$25", style: AppWidget.boldTextFieldStyle(),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/salad2.png',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Vegetable",
                              style: AppWidget.boldTextFieldStyle(),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Fresh and healthy",
                              style: AppWidget.lightTextFieldStyle(),
                            ),
                            Text("\$25", style: AppWidget.boldTextFieldStyle(),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(2),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Image.asset('images/salad2.png', height: 120,width: 120,fit: BoxFit.cover,),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          child: Text("Best vegetable in world",style: AppWidget.boldTextFieldStyle(),),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          child: Text("Very good for the healthy",style: AppWidget.lightTextFieldStyle(),),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          child: Text("\$28",style: AppWidget.boldTextFieldStyle(),),
                        ),
                      ],
                    )
                  ],),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            icecream = true;
            pizza = false;
            burger = false;
            salad = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'images/ice-cream.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: icecream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'images/pizza.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;
            burger = false;
            salad = true;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: salad ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'images/salad.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;
            salad = false;
            burger = true;

            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'images/burger.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
