import 'dart:io';

import 'package:flutter/material.dart';

import '../models/place.dart';

import '../helpers/db_helper.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image,) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location: PlaceLocation(
          latitude: 0.0,
          longitude: 0.0,
        )
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }
}