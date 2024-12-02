import 'package:domain/entities/doctor.dart';
import 'package:domain/repositories/doctor_repository.dart';


class GetDoctorsUseCase {
  final DoctorRepository repository;

  GetDoctorsUseCase(this.repository);

  Future<List<Doctor>> call() async {
    return await repository.getDoctors();
  }
}