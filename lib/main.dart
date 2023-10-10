import 'package:flutter/material.dart';
import 'package:login_chotot/DangKy.dart';
import 'package:login_chotot/DetailDMSP.dart';
import 'package:login_chotot/ForgotPass.dart';
import 'package:login_chotot/HomePage.dart';
import 'package:login_chotot/login_screen.dart'; // Đảm bảo import đúng file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) {
          bool isMobileLayout = MediaQuery.of(context).size.width < 800;
          return LoginScreen(isDesktop: !isMobileLayout);
        },
        '/forget-password': (context) => const ForgotPass(),
        '/register': (context) => const DangKy(),
        '/DetailDMSP': (context) => DetailDMSP(),
      },
    );
  }
}
