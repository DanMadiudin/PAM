import 'package:doctor_app/base/common/styles/custom_icons.dart';
import 'package:doctor_app/base/common/styles/text_style.dart';
import 'package:doctor_app/base/common/widgets/t_divider.dart';
import 'package:doctor_app/base/common/widgets/t_icon_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../../components/doctor.dart';
import 't_favorite.dart';

class DoctorVisitCard extends StatelessWidget {
  const DoctorVisitCard(
      {super.key, required this.doctorInfo, required this.onFavoriteToggle});

  final Doctor doctorInfo;
  final VoidCallback onFavoriteToggle; // Funcția de toggle

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
                doctorInfo.image,
                fit: BoxFit.fitHeight,
                height: 121,
                width: 121,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Container(
                    height: 121,
                    width: 121,
                    decoration: BoxDecoration(
                      color: Colors.grey[300], // Fundal gri pentru placeholder
                      borderRadius:
                          BorderRadius.circular(10), // Rounding corners
                    ),
                    child: Center(
                      child: Icon(
                        Icons.error, // Poți folosi un icon de eroare
                        color: Colors.red, // Culoarea iconului
                      ),
                    ),
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
                      Text(doctorInfo.name, style: AppStyle.title),
                      TFavorite(
                        isFavorite: doctorInfo
                            .isFavorite, // Transmite starea favoritului
                        onToggle:
                            onFavoriteToggle, // Transmite funcția de toggle
                      )
                    ],
                  ),
                  const TDivider(),
                  Text(
                    doctorInfo.specialization,
                    style: AppStyle.category
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  TIconText(
                      text: doctorInfo.location,
                      textSize: 14,
                      iconPath: TIcons.location),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      StarRating(
                        starCount: 1,
                        color: const Color.fromRGBO(254, 176, 82, 1),
                        rating: doctorInfo.rating,
                      ),
                      Text(
                          '${doctorInfo.rating}   |   ${doctorInfo.reviews} Reviews',
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
