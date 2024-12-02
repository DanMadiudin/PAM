import 'package:doctor_app/base/common/styles/sizes.dart';
import 'package:doctor_app/base/widgets/bottom.dart';
import 'package:doctor_app/base/widgets/doctors_list.dart';
import 'package:doctor_app/base/widgets/carousel.dart';
import 'package:doctor_app/base/widgets/custom_appbar.dart';
import 'package:doctor_app/base/widgets/middle.dart';
import 'package:flutter/material.dart';

import 'base/common/widgets/t_search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Doctor Appointment',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: ListView(
            children: const [
              TSearchBar(),
              SizedBox(height: TSizes.spaceBtwItems),
              CostumeCarouselSlider(),
              SizedBox(height: TSizes.spaceBtwSections),
              Middle(),
              SizedBox(height: TSizes.spaceBtwSections),
              Bottom(),
              SizedBox(height: TSizes.spaceBtwSections),
              Cards(),
              SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ));
  }
}
