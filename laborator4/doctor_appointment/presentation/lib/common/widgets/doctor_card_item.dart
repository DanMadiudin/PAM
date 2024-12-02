import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:domain/entities/doctor.dart';

import '../styles/custom_icons.dart';
import '../styles/text_style.dart';
import 't_devider.dart';
import 't_icon_text.dart';

class DoctorCardItem extends StatelessWidget {
  const DoctorCardItem(
      {super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Rounding corners
              child: Image.network(
                doctor.image,
                fit: BoxFit.fitHeight,
                height: 121,
                width: 121,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/imagePlaceholder.png',
                    fit: BoxFit.cover,
                    height: 121,
                    width: 121,
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(doctor.fullName, style: AppStyle.title),
                      const Icon(Icons.favorite_border_rounded)
                    ],
                  ),
                  const TDivider(),
                  Text(
                    doctor.typeOfDoctor,
                    style: AppStyle.category
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  TIconText(
                      text: doctor.locationOfCenter,
                      textSize: 14,
                      iconPath: TIcons.location),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      StarRating(
                        starCount: 1,
                        color: const Color.fromRGBO(254, 176, 82, 1),
                        rating: doctor.reviewRate,
                      ),
                      Text(
                          '${doctor.reviewRate}   |   ${doctor.reviewsCount} Reviews',
                          style: AppStyle.carouselText.copyWith(
                              color: const Color.fromRGBO(107, 114, 128, 1)))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
