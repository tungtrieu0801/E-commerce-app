

import 'package:ecommerceapp/widget/widget_support.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            Image.asset(
              'images/salad2.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fill,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mediernanea', style: AppWidget.boldTextFieldStyle(),),
                    Text('Chicken Salad', style: AppWidget.boldTextFieldStyle(),),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    if(a>1){
                      --a;
                      setState(() {

                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5)),
                    child: Icon(Icons.remove, color: Colors.white,),
                  ),
                ),
                SizedBox(width: 10,),
                Text(a.toString(), style: AppWidget.boldTextFieldStyle()),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    ++a;
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5)),
                    child: Icon(Icons.add, color: Colors.white,),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", style: AppWidget.lightTextFieldStyle(),),
            SizedBox(height: 15,),
            Row(
              children: [
                Text("Delivery time", style: AppWidget.boldTextFieldStyle(),),
                SizedBox(width: 25,),
                Icon(Icons.alarm, color: Colors.black38,),
                SizedBox(width: 5,),
                Text('30 min',style: AppWidget.boldTextFieldStyle(),),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price", style: AppWidget.boldTextFieldStyle(),),
                      Text("\$28", style: AppWidget.boldTextFieldStyle(),),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      Text("Add to cart", style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Poppins')),
                      SizedBox(width: 30,),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(10)),
                        child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                      ),
                        SizedBox(width: 10,),
                    ],),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
