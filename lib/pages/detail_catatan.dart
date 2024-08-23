import 'package:berbagi_catatan/data/gambar_data.dart';
import 'package:berbagi_catatan/data/komen_data.dart';
import 'package:berbagi_catatan/data/login_data.dart';
import 'package:berbagi_catatan/model/catatan_model.dart';
import 'package:berbagi_catatan/model/gambar_model.dart';
import 'package:berbagi_catatan/model/komen_model.dart';
import 'package:berbagi_catatan/resources/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailCatatan extends StatefulWidget {
  final Catatan catatan;
  const DetailCatatan({super.key, required this.catatan});

  @override
  State<DetailCatatan> createState() => _DetailCatatanState();
}

class _DetailCatatanState extends State<DetailCatatan> {
  TextEditingController commentController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  List<Komen> komenList = [];
  List<Gambar> gambarList = [];

  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    komenList = KomenData().komen;
    gambarList = GambarData().gambar;
  }

  @override
  Widget build(BuildContext context) {
    Catatan catatan = widget.catatan;
    komenList = KomenData()
        .komen
        .where((element) => element.catatanId == catatan.id)
        .toList();
    gambarList = GambarData()
        .gambar
        .where((element) => element.catatanId == catatan.id)
        .toList();
    double height = MediaQuery.of(context).size.height;

    print('Gambar List Length ${gambarList.length}');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Expanded(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                      'Detail Catatan',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Warna().green100),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SizedBox(
                      height: height / 1.5,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: gambarList.length,
                          itemBuilder: (context, index) {
                            currentIndex = index;
                            return Container(
                              child: ClipRRect(
                                child: Image.asset(
                                  'lib/assets/${gambarList[index].image}',
                                  height: height / 1.5,
                                ),
                              ),
                            );
                          })),
                ),
                const SizedBox(
                  height: 8,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                const SizedBox(
                                  width: 16,
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
                        Row(
                          children: [
                            Text(
                              '${gambarList.length} Halaman',
                              style: TextStyle(color: Colors.grey),
                            )
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
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.normal),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    String? comment =
                                        commentController.text.trim();
                                    if (comment.isNotEmpty) {
                                      Komen komentar = Komen(
                                          catatanId: catatan.id,
                                          author:
                                              LoginData().getName().toString(),
                                          komen: comment);
                                      KomenData().komen.add(komentar);
                                      commentController.clear();
                                      setState(() {});
                                    } else {}
                                  },
                                  child: Icon(
                                    Icons.send,
                                    color: Warna().green100,
                                  ),
                                ))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: komenList.isEmpty
                              ? const Center(
                                  child: Text(
                                    'Belum ada komentar',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                )
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: komenList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                            width: 16,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                komenList[index].author,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Warna().green100,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(komenList[index].komen)
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  })),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
