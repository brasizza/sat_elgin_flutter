import 'package:elgin_sat_example/app/core/local_storage/local_storage.dart';

class HomeController {
  static HomeController? _instance;
  late final LocalStorage storage;

  // Avoid self isntance
  HomeController._({required localStorage}) {
    storage = localStorage;
  }
  factory HomeController.instance({required LocalStorage storage}) {
    _instance ??= HomeController._(localStorage: storage);
    return _instance!;
  }
}
