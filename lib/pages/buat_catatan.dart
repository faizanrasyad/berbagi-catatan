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
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukkan judul catatan...',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                              prefixIcon: Icon(
                                Icons.flag,
                                color: Warna().green100,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Judul can't be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                      Text(
                        'Gambar Catatan',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 16),
                        child: InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('OTW Upload')));
                          },
                          child: Container(
                            height: 200,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Warna().lightGrey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                                Text(
                                  'Unggah Gambar Catatan',
                                  style: TextStyle(color: Colors.grey),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
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
                        'Tags Catatan',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 16),
                        child: TextFormField(
                          controller: katController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Ketikkan tags (ex. Matematika)',
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.normal),
                              prefixIcon: Icon(
                                Icons.tag,
                                color: Warna().green100,
                              )),
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
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                          controller: kelasController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Ketikkan kelas (ex. 12)',
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.normal),
                              prefixIcon: Icon(
                                Icons.school,
                                color: Warna().green100,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Judul can't be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.cloud_upload),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Unggah Catatan',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ]),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Warna().green100,
                                foregroundColor: Colors.white,
                                minimumSize: Size(150, 50)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      )
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
