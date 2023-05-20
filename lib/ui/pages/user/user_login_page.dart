import 'package:flutter/material.dart';
import 'package:travelgo/ui/widgets/custom_button.dart';
import 'package:travelgo/ui/widgets/custom_text_form_field.dart';
import 'package:travelgo/ui/widgets/role_title.dart';

import '../../../shared/theme.dart';
import '../../widgets/title.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  @override
  Widget build(BuildContext context) {
    Widget inputSection() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: const [
            CustomTextFormField(
                title: "Email Address", hintText: "Your Email Address"),
            CustomTextFormField(
              title: "Password",
              hintText: "Enter Password",
              isHidden: true,
            )
          ],
        ),
      );
    }

    Widget submitButton() {
      return CustomButton(
        text: "Login",
        textSize: 16,
        onPressed: () {
          Navigator.pushNamed(context, '/main');
        },
        margin: EdgeInsets.symmetric(horizontal: 20),
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
                "Don't have an account?",
                style: blackTextStyle,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/user-signup');
                  },
                  child: Text(
                    "Sign Up",
                    style: brownTextStyle.copyWith(fontWeight: bold),
                  ))
            ],
          ),
          Text(
            "Or",
            textAlign: TextAlign.center,
            style: blackTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: SizedBox(
              height: 55,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/roles');
                },
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: warnaCoklat, width: 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultRadius))),
                child: Text(
                  "Change Role",
                  style: brownTextStyle,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
