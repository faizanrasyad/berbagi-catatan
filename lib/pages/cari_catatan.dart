import 'package:berbagi_catatan/data/catatan_data.dart';
import 'package:berbagi_catatan/model/catatan_model.dart';
import 'package:berbagi_catatan/pages/detail_catatan.dart';
import 'package:berbagi_catatan/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CariCatatan extends StatefulWidget {
  const CariCatatan({super.key});

  @override
  State<CariCatatan> createState() => CariCatatanState();
}

class CariCatatanState extends State<CariCatatan> {
  List<Catatan> filteredCatatan = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    filteredCatatan = CatatanData().catatan;
  }

  void search(String newQuery) {
    setState(() {
      query = newQuery;

      filteredCatatan = CatatanData().catatan.where((element) {
        final matchesQuery =
            element.judul.toLowerCase().contains(query.toLowerCase());

        return matchesQuery;
      }).toList();
    });
    print("Length Filtered Catatan ${filteredCatatan.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                  'Cari Catatan',
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: TextField(
                autofocus: true,
                onChanged: (value) {
                  search(value);
                },
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  hintText: 'Search...',
                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: query.isEmpty || filteredCatatan.isEmpty
                      ? Center(
                          child: Text(
                            'Tidak ada catatan',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
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
            )
          ],
        ),
      ),
    ));
  }
}
