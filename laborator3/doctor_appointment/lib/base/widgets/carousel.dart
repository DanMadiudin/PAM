import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/base/common/styles/text_style.dart';
import 'package:doctor_app/base/components/carousel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import '../../mocks/mock_carousel_items.dart';

class CostumeCarouselSlider extends StatefulWidget {
  const CostumeCarouselSlider({super.key});

  @override
  State<CostumeCarouselSlider> createState() => _CostumeCarouselSliderState();
}

class _CostumeCarouselSliderState extends State<CostumeCarouselSlider> {
  List<Banners> bannerItems = []; // Lista pentru stocarea item-urilor din JSON
  int _currentIndex = 0; // Variabila pentru a reține indexul curent

  @override
  void initState() {
    super.initState();
    loadBanners(); // Încarcă bannerele la inițializare
  }

  Future<void> loadBanners() async {
    String jsonString = await rootBundle.loadString('assets/v1.json');
    Map<String, dynamic> jsonData = jsonDecode(jsonString);

    setState(() {
      bannerItems = (jsonData['banners'] as List)
          .map((item) => Banners.fromJson(item))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:
          Alignment.bottomCenter, // Alinierea indicatorilor în partea de jos
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: 2.0,
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index; // Actualizăm indexul curent
              });
            },
          ),
          items: bannerItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(item.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 200, left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: AppStyle.carouselText.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          item.description,
                          style: AppStyle.carouselText,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        // Indicatorii plasați pe carousel
        Positioned(
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerItems.asMap().entries.map((entry) {
              return GestureDetector(
                child: Container(
                  width: _currentIndex == entry.key
                      ? 30.0
                      : 6.0, // Lățimea indicatorului activ
                  height:
                      6.0, // Înălțimea indicatorului (toți indicatorii au aceeași înălțime)
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: _currentIndex == entry.key
                        ? Colors.white
                        : const Color.fromRGBO(229, 231, 235,
                            1), // Culoarea pentru paginile inactive
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
