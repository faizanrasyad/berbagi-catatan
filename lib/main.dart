import 'package:berbagi_catatan/pages/login.dart';
import 'package:berbagi_catatan/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Berbagi Catatan',
    initialRoute: '/',
    routes: {'/': (context) => SplashScreen(), 'login': (context) => Login()},
    debugShowCheckedModeBanner: false,
  ));
}
