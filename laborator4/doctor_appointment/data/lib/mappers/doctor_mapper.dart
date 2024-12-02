import 'package:data/models/doctor_model.dart';
import 'package:domain/entities/doctor.dart';

class DoctorMapper {
  static Doctor toEntity(DoctorModel model) {
    return Doctor(
      image: model.image ?? 'default_image.png', // Asigură-te că ai valori implicite pentru null
      fullName: model.fullName ?? 'Dr. Unknown',
      typeOfDoctor: model.typeOfDoctor ?? 'General',
      locationOfCenter: model.locationOfCenter ?? 'Unknown Location',
      reviewRate: model.reviewRate ?? 0.0,
      reviewsCount: model.reviewsCount ?? 0,
    );
  }

  static List<Doctor> toEntityList(List<DoctorModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
