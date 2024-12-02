import 'dart:convert';

import 'package:doctor_app/base/common/widgets/t_fillters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import '../../mocks/mock_doctors.dart';
import '../common/styles/text_style.dart';
import '../common/widgets/doctor_visit_card.dart';
import '../components/doctor.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  late Future<void> _loadDoctorsFuture;
  List<Doctor> doctors = [];
  List<Doctor> sortedDoctors = [];
  String selectedFilter = 'Default'; // Stochează tipul de filtrare selectat

  @override
  void initState() {
    super.initState();
    _loadDoctorsFuture = loadDoctors();
  }

  Future<void> loadDoctors() async {
    String json = await rootBundle.loadString('assets/v1.json');
    Map<String, dynamic> data = jsonDecode(json);

    doctors = (data['doctors'] as List)
        .map((item) => Doctor.fromJson(item))
        .toList();

    sortedDoctors = List.from(doctors);
    //print('....number of doctors ${doctors.length} ${sortedDoctors.length}');
  }

  // Funcție pentru sortare
  void _sortDoctors(String criteria) {
    setState(() {
      if (criteria == 'name') {
        sortedDoctors.sort((a, b) => a.name.compareTo(b.name));
        selectedFilter = 'Name'; // Actualizează tipul de filtrare
      } else if (criteria == 'rating') {
        sortedDoctors.sort((a, b) => b.rating.compareTo(a.rating));
        selectedFilter = 'Rating'; // Actualizează tipul de filtrare
      } else if (criteria == 'reviews') {
        sortedDoctors.sort((a, b) => b.reviews.compareTo(a.reviews));
        selectedFilter = 'Reviews'; // Actualizează tipul de filtrare
      } else {
        sortedDoctors = List.from(doctors);
        selectedFilter = 'Default';
      }
    });
  }

  // Toggle favorite pentru un doctor
  void _toggleFavorite(Doctor doctor) {
    setState(() {
      doctor.isFavorite = !doctor.isFavorite; // Schimbă starea favoritului
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _loadDoctorsFuture,
      builder: (context, snapshot) {
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
                      selectedFilter: selectedFilter, onFilterChanged: _sortDoctors)
                ],
              ),
            ),
            Column(
              children: sortedDoctors.take(5).map((doctor) {
                return DoctorVisitCard(
                  onFavoriteToggle: () => _toggleFavorite(doctor),
                  doctorInfo: doctor,
                );
              }).toList(),
            ),
          ],
        );
      }
    );
  }
}
