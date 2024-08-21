import 'package:berbagi_catatan/model/komen_model.dart';
import 'package:berbagi_catatan/model/user_model.dart';

class KomenData {
  static final KomenData _instance = KomenData._internal();

  factory KomenData() {
    return _instance;
  }

  KomenData._internal();

  List<Komen> komen = [];
}
