import 'dart:convert';

import 'package:doctor_app/base/components/medical_center.dart';
import 'package:doctor_app/base/widgets/medical_center_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/widgets/t_section_heading.dart';


class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  List<NearbyCenter> centers = [];
  late Future<void> _loadCenterFuture; 

  @override
  void initState(){
    super.initState();
    _loadCenterFuture = loadCenters();
  }

  Future loadCenters() async {
    String json = await rootBundle.loadString('assets/v1.json');
    Map<String, dynamic> data = jsonDecode(json);

    centers = (data['nearby_centers'] as List)
        .map((item) => NearbyCenter.fromJson(item))
        .toList();
  } 


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _loadCenterFuture,
      builder: (context, snapshot) {
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
                      child: MedicalCenterCard(card: center),
                    ),
                  );
                  }),
            )
          ],
        );
      }
    );
  }
}
