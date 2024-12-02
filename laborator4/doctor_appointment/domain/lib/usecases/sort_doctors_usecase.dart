import 'package:domain/entities/doctor.dart';

class SortDoctorsUseCase {
  List<Doctor> call(List<Doctor> doctors, String criteria) {
    List<Doctor> sortedDoctors = List.from(doctors);

    switch (criteria) {
      case 'name':
        sortedDoctors.sort((a, b) => a.fullName.compareTo(b.fullName));
        break;
      case 'rating':
        sortedDoctors.sort((a, b) => b.reviewRate.compareTo(a.reviewRate));
        break;
      case 'reviews':
        sortedDoctors.sort((a, b) => b.reviewsCount.compareTo(a.reviewsCount));
        break;
      default:
        break;
    }

    return sortedDoctors;
  }
}
