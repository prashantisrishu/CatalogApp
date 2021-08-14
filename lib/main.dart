import 'package:catalogapp/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:catalogapp/pages/home_page.dart';
import 'package:catalogapp/utils/routes.dart';
import 'package:catalogapp/pages/login_page.dart';
import 'package:catalogapp/widget/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: MyTheme.darkTheme(context),
        theme: MyTheme.lightTheme(context),
        // initialRoute: MyRoutes.homeRoute,
        routes: {
          "/" : (context) => LoginPage(),
          MyRoutes.loginRoute : (context) => LoginPage(),
          MyRoutes.homeRoute : (context) => HomePage(),
          MyRoutes.cartRoute : (context) => CartPage(),
        },
      );
  }
}