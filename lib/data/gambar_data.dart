import 'package:berbagi_catatan/model/gambar_model.dart';
import 'package:berbagi_catatan/model/komen_model.dart';
import 'package:berbagi_catatan/model/user_model.dart';

class GambarData {
  static final GambarData _instance = GambarData._internal();

  factory GambarData() {
    return _instance;
  }

  GambarData._internal();

  List<Gambar> gambar = [
    Gambar(catatanId: 1, image: 'dimensi_tiga.jpg'),
    Gambar(catatanId: 1, image: 'dimensi_tiga_dua.jpg'),
  ];
}
