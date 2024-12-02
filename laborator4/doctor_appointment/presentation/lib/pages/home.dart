
import 'package:flutter/material.dart';
import '../common/styles/sizes.dart';
import '../common/widgets/t_search_bar.dart';
import '../widgets/bottom.dart';
import '../widgets/carousel_banner.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/doctors_list.dart';
import '../widgets/middle.dart';

class Home extends StatelessWidget {

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(),
        body:Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
                child: ListView(
                  children: [
                    const TSearchBar(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    CarouselBanner(),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    Middle(),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    Bottom(),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    DoctorsList(),
                  ],
                ),
              ));
  }
}
