import 'package:flutter/material.dart';
import 'package:travelgo/shared/theme.dart';
import 'package:travelgo/ui/widgets/custom_button.dart';
import 'package:travelgo/ui/widgets/custom_payment_dialog.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Payment",
                style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 24),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Please upload your transfer proof to complete your payment.",
                style: blackTextStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 32,
              ),
              CustomButton(
                  text: "Upload",
                  textSize: 16,
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return CustomPaymentDialog(
                            title: "Payment Success.",
                          );
                        });
                  }),
              SizedBox(
                height: 16,
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultRadius)),
                            title: Text("Are you sure you want to cancel?"),
                            content: SingleChildScrollView(
                                child: Column(
                              children: [
                                CustomButton(
                                    text: "Continue Booking",
                                    textSize: 16,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                SizedBox(height: 16),
                                Container(
                                  width: double.infinity,
                                  height: 56,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: warnaMerah),
                                      borderRadius:
                                          BorderRadius.circular(defaultRadius)),
                                  child: TextButton(
                                      onPressed: () {
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CustomPaymentDialog(title: "Booking Cancelled.");
                                            });
                                      },
                                      child: Text(
                                        "Cancel Booking",
                                        style: redTextStyle.copyWith(
                                            fontWeight: medium, fontSize: 16),
                                      )),
                                )
                              ],
                            )),
                          );
                        });
                  },
                  child: Text(
                    "Cancel Booking",
                    style: brownTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
