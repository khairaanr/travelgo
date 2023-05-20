import 'package:flutter/material.dart';
import 'package:travelgo/shared/theme.dart';
import 'package:travelgo/ui/widgets/custom_text_form_field.dart';

import '../../widgets/role_title.dart';
import '../../widgets/title.dart';

class UserSignUpPage extends StatefulWidget {
  const UserSignUpPage({super.key});

  @override
  State<UserSignUpPage> createState() => _UserSignUpPageState();
}

class _UserSignUpPageState extends State<UserSignUpPage> {
  @override
  Widget build(BuildContext context) {
    Widget inputSection() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: const [
            CustomTextFormField(title: "Name", hintText: "Your Name"),
            CustomTextFormField(title: "Username", hintText: "Your Username"),
            CustomTextFormField(title: "Email Address", hintText: "Your Email Address"),
            CustomTextFormField(title: "Password", hintText: "Enter Password", isHidden: true,),
            CustomTextFormField(title: "Confirm Password", hintText: "Re-enter Password", isHidden: true,)
          ],
        ),
      );
    }

    Widget submitButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/user-login');
            },
            style: TextButton.styleFrom(
                backgroundColor: warnaCoklat,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius))),
            child: Text(
              "Sign Up",
              style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 16),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(defaultMargin),
        children: [
          SizedBox(
            height: 15,
          ),
          title(null),
          SizedBox(
            height: 32,
          ),
          RoleTitle(title: "USER",),
          inputSection(),
          submitButton(),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: blackTextStyle,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/user-login');
                  },
                  child: Text(
                    "Login",
                    style: brownTextStyle.copyWith(fontWeight: bold),
                  ))
            ],
          )
        ],
      )),
    );
  }
}
