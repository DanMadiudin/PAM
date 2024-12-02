import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../../models/nearby_centers.dart';
import '../styles/custom_icons.dart';
import '../styles/text_style.dart';
import 't_devider.dart';
import 't_icon_text.dart';

class NearbyCenterItem extends StatelessWidget {
  const NearbyCenterItem({super.key, required this.center});
  final NearbyCenters center;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.network(center.image!,
                fit: BoxFit.cover, height: 121, width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/images/imagePlaceholder.png',
                fit: BoxFit.cover,
                height: 121,
                width: double.infinity,
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
                  center.title!, // Numele centrului
                  style: AppStyle.title.copyWith(fontSize: 14), // Font îngroșat
                ),
                const SizedBox(height: 4), // Spațiu între elemente

                TIconText(
                    text: center.locationName!,
                    iconPath: TIcons.location,
                    iconSize: 14),
                const SizedBox(height: 4), // Spațiu între elemente
                Row(
                  children: [
                    Text(
                      center.reviewRate.toString(), // Afișează ratingul
                      style: AppStyle.seeAll.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12), // Stil pentru text
                    ),
                    const SizedBox(width: 4),
                    StarRating(
                      rating: center.reviewRate!,
                      color: const Color.fromRGBO(254, 176, 82, 1),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text('(${center.countReviews} Reviews)',
                        style: AppStyle.seeAll.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 12))
                  ],
                ),
                const TDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TIconText(
                        text:
                            '${center.distanceKm}km/${center.distanceMinutes}min',
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
