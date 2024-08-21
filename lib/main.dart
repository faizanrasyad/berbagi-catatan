import 'package:berbagi_catatan/pages/buat_catatan.dart';
import 'package:berbagi_catatan/pages/cari_catatan.dart';
import 'package:berbagi_catatan/pages/home.dart';
import 'package:berbagi_catatan/pages/detail_catatan.dart';
import 'package:berbagi_catatan/pages/login.dart';
import 'package:berbagi_catatan/pages/register.dart';
import 'package:berbagi_catatan/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Berbagi Catatan',
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/login': (context) => Login(),
      '/register': (context) => Register(),
      '/home': (context) => Home(),
      '/buat': (context) => BuatCatatan(),
      '/cari': (context) => CariCatatan()
    },
    debugShowCheckedModeBanner: false,
  ));
}
