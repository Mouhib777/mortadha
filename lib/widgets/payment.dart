import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PaymentScreen extends StatefulWidget {

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: () async {
                  makepayment("55", 'EUR');
                  // makepayment((double.parse(widget.amount)).toString(), "EUR");
                },
                child: Text("Pay"),
               
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent),
              ),
            ),
          
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic>? paymentIntentData;
  Future<void> makepayment(String amount, String currency) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          googlePay: PaymentSheetGooglePay(
            merchantCountryCode: 'DE',
          ),
          merchantDisplayName: "Prospects",
          customerId: paymentIntentData!['customer'],
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          customerEphemeralKeySecret: paymentIntentData!['ephemeralkey'],
        ));
        displayPaymentSheet();
      }
    } catch (e, s) {
      print("EXCEPTION ===$e$s");
    }
  }

  createPaymentIntent(String amount, String currency) async {
    int amountInCents = (35.7 * 100).toInt();
    //  (double.parse(widget.amount) * 100).toInt();
    try {
      Map<String, dynamic> body = {
        'amount': amountInCents.toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            'Authorization':
                "Bearer SECRET_Key", //talkah f stripe
            'Content-Type': 'application/x-www-form-urlencoded',
          });
      return jsonDecode(response.body);
    } catch (err) {
      print('err => $err');
    }
  }

  void displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();

      AnimatedSnackBar.rectangle(
        mobileSnackBarPosition: MobileSnackBarPosition.top,
        'Pay sucessful',
        '',
        type: AnimatedSnackBarType.success,
        brightness: Brightness.light,
      ).show(
        context,
      );

      // / / / / / / / / / / / / / / / / / / / / /
    } on Exception catch (e) {
      if (e is StripeException) {
        print('error from stripe $e');
      } else {
        print("error mn blassa okhra => $e");
      }
    } catch (e) {
      print('exception => $e');
    }
  }
}
