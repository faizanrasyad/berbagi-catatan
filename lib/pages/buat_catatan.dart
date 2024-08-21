import 'package:berbagi_catatan/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuatCatatan extends StatefulWidget {
  const BuatCatatan({super.key});

  @override
  State<BuatCatatan> createState() => _BuatCatatanState();
}

class _BuatCatatanState extends State<BuatCatatan> {
  TextEditingController judulController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController katController = TextEditingController();
  TextEditingController kelasController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: SafeArea(
              child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Buat Catatan',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Warna().green100),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Judul Catatan',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 16),
                        child: TextFormField(
                          controller: judulController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukkan judul catatan...',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                              prefixIcon: Icon(Icons.tag)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Judul can't be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                      Text(
                        'Deskripsi Catatan',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 16),
                        child: TextFormField(
                          controller: descController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukkan deskripsi catatan...',
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.normal),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 10)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Deskripsi can't be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                      Text(
                        'Kategori Catatan',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 16),
                        child: TextFormField(
                          controller: katController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Kategori',
                              hintText: 'Pilih kategori catatan...',
                              prefixIcon: Icon(Icons.person)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Judul can't be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                      Text(
                        'Kelas',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 16),
                        child: TextFormField(
                          controller: kelasController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Kelas',
                              hintText: 'Pilih kelas...',
                              prefixIcon: Icon(Icons.person)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Judul can't be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  )),
                ),
              )
            ],
          ),
        ),
      ))),
    );
  }
}
