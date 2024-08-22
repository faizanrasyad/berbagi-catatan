import 'dart:io';

import 'package:berbagi_catatan/data/catatan_data.dart';
import 'package:berbagi_catatan/data/login_data.dart';
import 'package:berbagi_catatan/model/catatan_model.dart';
import 'package:berbagi_catatan/pages/detail_catatan.dart';
import 'package:berbagi_catatan/resources/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name = LoginData().getName();
  String kelas = '0';
  List<Catatan> filteredCatatan = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredCatatan = CatatanData().catatan;
  }

  void filter(String kelas) {
    this.kelas = kelas;
    filteredCatatan = CatatanData()
        .catatan
        .where((element) => element.kelas == kelas)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Warna().green100,
        onPressed: () {
          Navigator.pushNamed(context, '/buat');
        },
        child: Icon(
          Icons.note_add,
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
                            fontSize: 18,
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
                          child: PopupMenuButton<String>(
                            child: Icon(
                              Icons.sort,
                              color: Colors.white,
                            ),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: '0',
                                child: Text(
                                  'Semua',
                                  style: TextStyle(color: Warna().green100),
                                ),
                              ),
                              PopupMenuItem(
                                value: '10',
                                child: Text(
                                  'Kelas 10',
                                  style: TextStyle(color: Warna().green100),
                                ),
                              ),
                              PopupMenuItem(
                                value: '11',
                                child: Text(
                                  'Kelas 11',
                                  style: TextStyle(color: Warna().green100),
                                ),
                              ),
                              PopupMenuItem(
                                value: '12',
                                child: Text(
                                  'Kelas 12',
                                  style: TextStyle(color: Warna().green100),
                                ),
                              ),
                            ],
                            color: Colors.white,
                            elevation: 2,
                            onSelected: (value) {
                              if (value != '0') {
                                filter(value);
                              } else {
                                filteredCatatan = CatatanData().catatan;
                              }

                              setState(() {});
                            },
                          )),
                    ],
                  )
                ],
              ),
              Expanded(
                  child: filteredCatatan.isEmpty
                      ? const Center(
                          child: Text(
                            'Tidak ada catatan',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredCatatan.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DetailCatatan(
                                              catatan: filteredCatatan[index],
                                            )));
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.asset(
                                        'lib/assets/${filteredCatatan[index].gambar}',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Flexible(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: Text(
                                            filteredCatatan[index].judul,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.person,
                                              size: 18,
                                              color: Warna().green100,
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  right: 4.0),
                                              child: Text(
                                                "${filteredCatatan[index].author}",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Warna().green100),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.school,
                                              size: 18,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "Kelas ${filteredCatatan[index].kelas}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            );
                          })),
            ],
          ),
        ),
      ),
    );
  }
}
