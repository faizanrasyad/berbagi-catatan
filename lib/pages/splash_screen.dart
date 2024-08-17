import 'dart:async';
import 'package:berbagi_catatan/pages/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    color: Theme.of(context).colorScheme.background,
                    child: Image.asset(
                      'lib/assets/icon.png',
                      width: 100,
                    )),
                Container(
                  child: Text(
                    'Berbagi Catatan',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF508266)),
                  ),
                )
              ],
            ),
          ),
        )); //FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
