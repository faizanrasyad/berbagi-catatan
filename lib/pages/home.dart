import 'package:berbagi_catatan/data/login_data.dart';
import 'package:berbagi_catatan/resources/color.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name = LoginData().getName();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Warna().green100,
        onPressed: () {
          Navigator.pushNamed(context, '/buat');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/assets/icon.png',
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Hi ${LoginData().getName()}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Warna().green100),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Warna().green100,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/cari');
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Warna().green100,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.sort,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
