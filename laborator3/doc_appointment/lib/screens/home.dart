import 'package:doc_appointment/common/widgets/t_search_bar.dart';
import 'package:doc_appointment/widgets/carousel_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/styles/sizes.dart';
import '../controllers/main_controller.dart';
import '../widgets/bottom.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/doctors_list.dart';
import '../widgets/middle.dart';

class Home extends StatelessWidget {
  final MainController mainController = Get.put(MainController());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(),
        body: Obx(() => mainController.isLoadig.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
                child: ListView(
                  children: [
                    TSearchBar(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    CarouselBanner(),
                    SizedBox(height: TSizes.spaceBtwSections),
                    Middle(),
                    SizedBox(height: TSizes.spaceBtwSections),
                    Bottom(),
                    SizedBox(height: TSizes.spaceBtwSections),
                    DoctorsList(),
                  ],
                ),
              )));
  }
}
