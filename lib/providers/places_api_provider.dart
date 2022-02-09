import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sigmatenant/models/sigma_places.dart';

import 'db_provider.dart';

class placesapiprovider {
  Future<List<Null>> getallplaces() async {
    var url = "https://sigmatenant.com/mobile/tags";
    Response response = await Dio().get(url);

    // ignore: avoid_types_as_parameter_names
    return (response.data as List).map((places1) {
      print('Inserting $places1');
      DBProvider.db.createplaces(Places.fromJson(places1));
    }).toList();
  }
}
