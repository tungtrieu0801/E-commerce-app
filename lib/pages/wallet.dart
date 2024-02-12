import 'dart:convert';
import 'package:ecommerceapp/service/share_pref.dart';
import 'package:ecommerceapp/widget/app_constant.dart';
import 'package:ecommerceapp/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import '../service/database.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? wallet, id;
  int? add;
  TextEditingController editingControllerAmount = new TextEditingController();

  getthesharedpref() async {
    wallet = await SharedPreferenceHelper().getUserWallet();
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wallet == null
          ? CircularProgressIndicator()
          : Container(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 2.0,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: Text(
                          "Wallet",
                          style: AppWidget.headlineTextFieldStyle(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/wallet.png',
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your wallet",
                              style: AppWidget.boldTextFieldStyle(),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$" + wallet!,
                              style: AppWidget.boldTextFieldStyle(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Add money",
                      style: AppWidget.boldTextFieldStyle(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          makePayment('100');
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "\$" + '100'!,
                            style: AppWidget.boldTextFieldStyle(),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          makePayment('500');
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "\$" + "500",
                            style: AppWidget.boldTextFieldStyle(),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          makePayment('1000');
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "\$" + "1000",
                            style: AppWidget.boldTextFieldStyle(),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          makePayment('2000');
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "\$" + "2000",
                            style: AppWidget.boldTextFieldStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: (){
                      openEdit();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFF008080),
                          borderRadius: BorderRadius.circular(7)),
                      child: Center(
                        child: Text(
                          "Add Money",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'INR');
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
                  // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Adnan'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet(amount);
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        add = int.parse(wallet!) + int.parse(amount);
        await SharedPreferenceHelper().saveUserWallet(add.toString());
        await DatabaseMethods().UpdateUserWallet(id!, add.toString());
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          Text("Payment Successfull"),
                        ],
                      ),
                    ],
                  ),
                ));
        await getthesharedpref();
        // ignore: use_build_context_synchronously

        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $hiddenkey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;

    return calculatedAmout.toString();
  }

  Future openEdit() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.cancel),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Center(
                          child: Text(
                            "Add money",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Amount"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 2.0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: editingControllerAmount,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your money"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        makePayment(editingControllerAmount.text);
                      },
                      child: Container(
                        width: 100,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(child: Text("Pay", style: TextStyle(color: Colors.white),)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
}
