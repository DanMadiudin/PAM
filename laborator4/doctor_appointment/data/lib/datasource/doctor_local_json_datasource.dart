import 'dart:convert';
import 'dart:io';

import 'package:data/mocks/doctors_mock_data.dart';
import '../models/doctor_model.dart';

abstract class DoctorLocalJsonDataSource {
  Future<List<DoctorModel>> getDoctors();
}

class DoctorLocalJsonDataSourceImpl implements DoctorLocalJsonDataSource {
  @override
  Future<List<DoctorModel>> getDoctors() async {
    try {
      String json = await File('assets/localData.json').readAsString();
      var result = jsonDecode(json);

      return (result['doctors'] as List)
          .map((data) => DoctorModel.fromJson(data))
          .toList();
    } catch (e) {
      print('Error loading doctors: $e');
      await Future.delayed(Duration(seconds: 5));
      return doctorsMockData;
    }
  }
}
