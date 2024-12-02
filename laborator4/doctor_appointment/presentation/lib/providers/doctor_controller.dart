import 'package:domain/usecases/get_doctors_usecase.dart';
import 'package:domain/usecases/sort_doctors_usecase.dart';
import 'package:get/get.dart';
import 'package:domain/entities/doctor.dart';

class DoctorController extends GetxController {
  final GetDoctorsUseCase getDoctorsUseCase;
  final SortDoctorsUseCase sortDoctorsUseCase;

  DoctorController(this.getDoctorsUseCase, this.sortDoctorsUseCase);

  final doctors = <Doctor>[].obs;
  RxList<Doctor> sortedDoctors = <Doctor>[].obs;
  var selectedFilter = "Default".obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  void fetchDoctors() async {
    final result = await getDoctorsUseCase();
    doctors.value = result;
    sortedDoctors.assignAll(doctors);
  }

  void sortDoctors(String criteria) {
    selectedFilter.value = criteria;
    if (criteria == 'default') {
      sortedDoctors.assignAll(doctors);
    } else {
      sortedDoctors.assignAll(sortDoctorsUseCase(sortedDoctors, criteria));
    }
  }
}
