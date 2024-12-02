import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/styles/text_style.dart';
import '../providers/banner_controller.dart';

class CarouselBanner extends StatelessWidget {
  final bannerController = Get.find<BannerController>();
  CarouselBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = bannerController.banners;
    return Obx(() {
      // Verificăm dacă lista de bannere este goală
      if (banners.isEmpty) {
        return const Center(
            child:
                CircularProgressIndicator()); // Afișează indicator de încărcare până când se încarcă bannerele
      }

      return Stack(
        alignment: Alignment.bottomCenter,
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
                bannerController.updateIndex(index);
              },
            ),
            items: banners.map((banner) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(banner.image),
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
                            banner.title,
                            style: AppStyle.carouselText.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            banner.description,
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
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: banners.asMap().entries.map((entry) {
                return GestureDetector(
                  child: Container(
                    width: bannerController.currentIndex.value == entry.key
                        ? 30.0
                        : 6.0, // Lățimea indicatorului activ
                    height: 6.0, // Înălțimea indicatorului
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      color: bannerController.currentIndex.value == entry.key
                          ? Colors.white
                          : const Color.fromRGBO(229, 231, 235, 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
    });
  }
}
