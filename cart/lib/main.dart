import 'package:cart/core/Store.dart';
import 'package:cart/pages/HomePage.dart';
import 'package:cart/pages/Login_page.dart';
import 'package:cart/pages/cart_page.dart';
import 'package:cart/utils/routes.dart';
import 'package:cart/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyThemes.darkTheme(context),
      initialRoute: MyRoutes.LoginRoute,
      routes: {
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
