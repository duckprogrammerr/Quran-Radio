import 'package:audio_palyer/data/loacl_storage.dart';
import 'package:audio_palyer/data/radio_list.dart';
import 'package:audio_palyer/models/radio_model.dart';

import 'package:flutter/material.dart';

class FavoritViewModel extends ChangeNotifier {
  List<RadioModel> _favList = [];
  List<RadioModel> get favList => _favList;

  Future<void> deleteAll() async {
    await FavoritRadios().deleteAll();
  }

  Future<void> getFavList() async {
    List<RadioModel> favorit = [];
    Map<String, String> fav = await FavoritRadios().getAllFav();
    fav.forEach((key, value) {
      favorit.add(radios[int.parse(key)]);
    });
    _favList = favorit;
    notifyListeners();
  }

  void deleteFav(RadioModel r) {
    FavoritRadios().delete('${radios.indexOf(r)}');
    _favList.remove(r);
    notifyListeners();
  }

  void addFav(RadioModel r) {
    FavoritRadios().add('${radios.indexOf(r)}');
    _favList.contains(r) ? null : _favList.add(r);
    notifyListeners();
  }
}
