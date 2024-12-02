import 'package:doc_appointment/common/widgets/doctor_card_item.dart';
import 'package:doc_appointment/controllers/doctor_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../common/styles/text_style.dart';
import '../common/widgets/t_fillters.dart';

class DoctorsList extends StatelessWidget {
  final doctorController = Get.put(DoctorController());
  DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = doctorController.sortedDoctors;
    return Obx(() => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${doctors.length} founds',
                    style: AppStyle.title,
                  ),
                  TFiltter(
                      selectedFilter: doctorController.selectedFilter.value,
                      onFilterChanged: doctorController.sortDoctors)
                ],
              ),
            ),
            Column(
              children: doctors.take(5).map((doctor) {
                return GetBuilder<DoctorController>(
                    builder: (controller) => DoctorCardItem(
                          onFavoriteToggle: () =>
                              controller.toggleFavorite(doctor),
                          doctor: doctor,
                        ));
              }).toList(),
            ),
          ],
        ));
  }
}
