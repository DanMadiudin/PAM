import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../common/styles/text_style.dart';
import '../common/widgets/doctor_card_item.dart';
import '../common/widgets/t_fillters.dart';
import '../providers/doctor_controller.dart';

class DoctorsList extends StatelessWidget {
  final doctorController = Get.find<DoctorController>();
  DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = doctorController.sortedDoctors;
    return Obx(() {
      // Verificăm dacă lista de bannere este goală
      if (doctors.isEmpty) {
        return const Center(
            child:
                CircularProgressIndicator()); // Afișează indicator de încărcare până când se încarcă bannerele
      }
      return Column(
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
                  onFilterChanged: doctorController.sortDoctors,
                ),
              ],
            ),
          ),
          Column(
            children: doctors.take(5).map((doctor) {
              return DoctorCardItem(
                doctor: doctor,
              );
            }).toList(),
          ),
        ],
      );
    });
  }
}
