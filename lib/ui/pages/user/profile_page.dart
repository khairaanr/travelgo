import 'package:flutter/material.dart';
import 'package:travelgo/services/user_service.dart';

import '../../../shared/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          children: [
            SizedBox(height: 32,),
            Text(
                "PROFILE",
                style: blackTextStyle.copyWith(
                    fontWeight: semibold, fontSize: 24, letterSpacing: 3),
            ),
            SizedBox(height: 32,),
            Container(
              width: 200,
              height: 56,
              decoration: BoxDecoration(
                color: warnaMerah, borderRadius: BorderRadius.circular(defaultRadius)
              ),
              child: TextButton(onPressed: () {
                setState(() {
                  logout();
                });
              }, child: Text("Logout", style: whiteTextStyle,)))
          ],
        ),
      )),
    );
  }
}