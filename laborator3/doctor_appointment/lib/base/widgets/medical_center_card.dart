import 'package:doctor_app/base/common/styles/text_style.dart';
import 'package:doctor_app/base/common/widgets/t_divider.dart';
import 'package:doctor_app/base/common/widgets/t_icon_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../common/styles/custom_icons.dart';
import '../components/medical_center.dart'; // Asigură-te că acest import este corect

class MedicalCenterCard extends StatelessWidget {
  const MedicalCenterCard({super.key, required this.card});
  final NearbyCenter card;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10.0)),
            child: Image.network(card.image, 
                fit: BoxFit.cover, 
                height: 121, 
                width: double.infinity, 
                errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 121, 
                color: Colors
                    .grey, // Poți schimba culoarea sau poți folosi un alt widget
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.title, // Numele centrului
                  style: AppStyle.title.copyWith(fontSize: 14), // Font îngroșat
                ),
                const SizedBox(height: 4), // Spațiu între elemente

                TIconText(
                    text: card.locationName,
                    iconPath: TIcons.location,
                    iconSize: 14),
                const SizedBox(height: 4), // Spațiu între elemente
                Row(
                  children: [
                    Text(
                      card.reviewRate.toString(), // Afișează ratingul
                      style: AppStyle.seeAll.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12), // Stil pentru text
                    ),
                    const SizedBox(width: 4),
                    StarRating(
                      rating: card.reviewRate,
                      color: const Color.fromRGBO(254, 176, 82, 1),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text('(${card.countReviews} Reviews)',
                        style: AppStyle.seeAll.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 12))
                  ],
                ),
                const TDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TIconText(
                        text: '${card.distanceKm}km/${card.distanceMinutes}min',
                        iconPath: TIcons.destination),
                    TIconText(text: 'Hospital', iconPath: TIcons.hospital),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
