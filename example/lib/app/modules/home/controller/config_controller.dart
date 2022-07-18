// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:elgin_sat_example/app/core/consts.dart';
import 'package:elgin_sat_example/app/core/local_storage/local_storage.dart';

class ConfigController {
  static ConfigController? _instance;
  late final LocalStorage storage;

  // Avoid self isntance
  ConfigController._({required LocalStorage localStorage}) {
    storage = localStorage;
  }
  factory ConfigController.instance({required LocalStorage storage}) {
    _instance ??= ConfigController._(localStorage: storage);
    return _instance!;
  }

  Future<bool> salvarDados(
      {required String codAtivacao, required String codSerial}) async {
    await storage.setData(Consts.keyCodAtivacao, codAtivacao);
    await storage.setData(Consts.keySerial, codSerial);
    return true;
  }
}
