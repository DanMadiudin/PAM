import 'package:data/datasource/doctor_local_json_datasource.dart';
import 'package:data/mappers/doctor_mapper.dart';
import 'package:data/models/doctor_model.dart';
import 'package:domain/entities/doctor.dart';
import 'package:domain/repositories/doctor_repository.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorLocalJsonDataSource doctorDataSource;

  DoctorRepositoryImpl(this.doctorDataSource);

  @override
  Future<List<Doctor>> getDoctors() async {
    final List<DoctorModel> doctorModels = await doctorDataSource.getDoctors();

    return DoctorMapper.toEntityList(doctorModels);
  }
}
