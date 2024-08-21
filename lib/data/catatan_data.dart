import 'package:berbagi_catatan/model/catatan_model.dart';
import 'package:berbagi_catatan/model/user_model.dart';

class CatatanData {
  static final CatatanData _instance = CatatanData._internal();

  factory CatatanData() {
    return _instance;
  }

  CatatanData._internal();

  List<Catatan> catatan = [
    Catatan(
        judul: 'Dimensi Tiga',
        deskripsi: 'Materi dimensi tiga matematika kelas 12',
        kategori: 'Matematika',
        gambar: 'dimensi_tiga.jpg',
        author: 'Aulia Tana',
        kelas: '12')
  ];
}
