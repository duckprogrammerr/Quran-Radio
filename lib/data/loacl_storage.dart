import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FavoritRadios {
  final storage = const FlutterSecureStorage();
  Future add(String name) async {
    return await storage.write(
      key: name,
      value: '1',
    );
  }

  Future deleteAll() async {
    return await storage.deleteAll();
  }

  Future delete(String name) async {
    return await storage.delete(key: name);
  }

  Future getAllFav() async {
    return await storage.readAll();
  }
}
