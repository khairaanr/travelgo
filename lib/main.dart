import 'package:flutter/material.dart';
import 'package:travelgo/ui/pages/admin/admin_login_page.dart';
import 'package:travelgo/ui/pages/admin/admin_signup_page.dart';
import 'package:travelgo/ui/pages/get_started_page.dart';
import 'package:travelgo/ui/pages/select_role_page.dart';
import 'package:travelgo/ui/pages/splash_page.dart';
import 'package:travelgo/ui/pages/user/user_login_page.dart';
import 'package:travelgo/ui/pages/user/user_main_page.dart';
import 'package:travelgo/ui/pages/user/user_signup_page.dart.dart';
import 'package:travelgo/ui/pages/vendor/vendor_login_page.dart';
import 'package:travelgo/ui/pages/vendor/vendor_main_page.dart';
import 'package:travelgo/ui/pages/vendor/vendor_signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => SplashPage(),
        '/get-started':(context) => GetStartedPage(),
        '/roles':(context) => SelectRolePage(),
        '/user-login':(context) => UserLoginPage(),
        '/user-signup':(context) => UserSignUpPage(),
        '/main':(context) => UserMainPage(),
        '/admin-login':(context) => AdminLoginPage(),
        '/admin-signup':(context) => AdminSignUpPage(),
        '/vendor-login':(context) => VendorLoginPage(),
        '/vendor-signup':(context) => VendorSignUpPage(),
        '/main-vendor':(context) => VendorMainPage(),
      },
    );
  }
}