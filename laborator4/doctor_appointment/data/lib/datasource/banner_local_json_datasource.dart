import 'dart:convert';
import 'dart:io';

import 'package:data/mocks/banner_mock_data.dart';

import '../models/banner_model.dart'; // Pentru manipularea JSON

abstract class BannerLocalJsonDataSource {
  Future<List<BannerModel>> getBanners();
}

class BannerLocalJsonDataSourceImpl implements BannerLocalJsonDataSource {
  @override
  Future<List<BannerModel>> getBanners() async {
    try {
      String json = await File('assets/localData.json').readAsString();
      //String json = await rootBundle.loadString('assets/v1.json');
      var result = jsonDecode(json);
      print('JSON Data: $json');

      return (result['banners'] as List)
          .map((data) => BannerModel.fromJson(data))
          .toList();
    } catch (e) {
      print('Error loading doctors: $e');
      await Future.delayed(Duration(seconds: 5));
      return bannersMockData;
    }
  }
}
