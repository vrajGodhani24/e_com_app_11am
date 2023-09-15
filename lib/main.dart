import 'package:e_com_app_11am/screens/cart_page.dart';
import 'package:e_com_app_11am/screens/detail_page.dart';
import 'package:e_com_app_11am/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MyApp(),
        'detail_page': (context) => const DetailPage(),
        'cart_page': (context) => const CartPage(),
      },
    ),
  );
}
