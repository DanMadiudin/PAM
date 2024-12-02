import 'package:domain/entities/doctor.dart';

abstract class DoctorRepository {
  Future<List<Doctor>> getDoctors();
}