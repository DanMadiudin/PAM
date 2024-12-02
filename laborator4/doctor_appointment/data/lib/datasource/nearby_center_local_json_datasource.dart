import 'dart:convert';
import 'dart:io';
import 'package:data/mocks/nearby_center_mock_data.dart';

import '../models/nearby_center_model.dart'; // Importă modelul NearbyCenterModel

abstract class NearbyCenterLocalJsonDataSource {
  Future<List<NearbyCenterModel>> getNearbyCenters();
}

class NearbyCenterLocalJsonDataSourceImpl
    implements NearbyCenterLocalJsonDataSource {
  @override
  Future<List<NearbyCenterModel>> getNearbyCenters() async {
    try {
      // Încarcă fișierul JSON local
      String json = await File('assets/localData.json').readAsString();
      var result = jsonDecode(json);

      return (result['nearby_centers'] as List)
          .map((data) => NearbyCenterModel.fromJson(data))
          .toList();

    } catch (e) {
      print('Error loading doctors: $e');
      await Future.delayed(Duration(seconds: 5));
      return nearbyCentersMockData;
    }
  }
}
