import 'package:berbagi_catatan/model/catatan_model.dart';
import 'package:berbagi_catatan/resources/color.dart';
import 'package:flutter/material.dart';

class DetailCatatan extends StatefulWidget {
  final Catatan catatan;
  const DetailCatatan({super.key, required this.catatan});

  @override
  State<DetailCatatan> createState() => _DetailCatatanState();
}

class _DetailCatatanState extends State<DetailCatatan> {
  TextEditingController commentController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Catatan catatan = widget.catatan;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Detail Catatan',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Warna().green100),
                  )
                ],
              ),
              ClipRRect(
                child: Image.asset(
                  'lib/assets/${catatan.gambar}',
                  width: MediaQuery.of(context).size.width,
                  height: height / 1.5,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                            catatan.judul,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Warna().green100,
                        child: Icon(
                          Icons.person,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dibagikan oleh',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            catatan.author,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Warna().green100,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    catatan.deskripsi,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Komentar',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Form(
                    key: formkey,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 4,
                      ),
                      child: TextFormField(
                        controller: commentController,
                        decoration: InputDecoration(
                            hintText: 'Masukkan komentar disini...',
                            hintStyle: TextStyle(fontWeight: FontWeight.normal),
                            suffixIcon: Icon(
                              Icons.send,
                              color: Warna().green100,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 300,
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
