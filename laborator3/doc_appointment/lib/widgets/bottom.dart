import 'package:doc_appointment/common/widgets/nearby_center_item.dart';
import 'package:doc_appointment/controllers/center_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/widgets/t_section_heading.dart';

class Bottom extends StatelessWidget {
  final CenterController centerController = Get.put(CenterController());
  Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    final centers = centerController.nearbyCenters;
    return Column(
          children: [
            TSectionHeading(title: 'Nearby Medical Centers', onPressed: (){},),
            SizedBox(
              height: 252,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: centers.length,
                  itemBuilder: (context, index) {
                    final center = centers[index];
                    return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                      width: 252, // Setează o lățime fixă pentru card
                      child: NearbyCenterItem(center: center),
                    ),
                  );
                  }),
            )
          ],
        );
  }
}