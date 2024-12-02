import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/widgets/nearby_center_item.dart';
import '../common/widgets/t_section_heading.dart';
import '../providers/nearby_center_controller.dart';

class Bottom extends StatelessWidget {
  final NearbyCenterController centerController =
      Get.find<NearbyCenterController>();

  Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    final centers = centerController.nearbyCenters;
    return Column(
      children: [
        TSectionHeading(
          title: 'Nearby Medical Centers',
          onPressed: () {},
        ),
        SizedBox(
          height: 252,
          child: Obx(() {
            if (centers.isEmpty) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Afișează indicator de încărcare până când se încarcă bannerele
          }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: centers.length,
              itemBuilder: (context, index) {
                final center = centers[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    width: 252,
                    child: NearbyCenterItem(center: center),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
