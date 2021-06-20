import 'package:flutter/material.dart';
import 'package:udemy_form_app/src/bloc/provider.dart';
import 'package:udemy_form_app/src/pages/home/home_page.dart';
import 'package:udemy_form_app/src/pages/login/login_page.dart';
import 'package:udemy_form_app/src/pages/product/product_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'product': (BuildContext context) => ProductPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
      ),
    );
  }
}
