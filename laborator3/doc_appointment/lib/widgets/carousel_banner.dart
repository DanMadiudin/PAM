import 'package:carousel_slider/carousel_slider.dart';
import 'package:doc_appointment/controllers/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/styles/text_style.dart';

class CarouselBanner extends StatelessWidget {
  final BannerController bannerController = Get.put(BannerController());

  CarouselBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = bannerController.banners;
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
              bannerController.updateIndex(
                  index); // Apelează metoda pentru a actualiza indexul curent
            },
          ),
          items: banners.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(banner.image!),
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
                          banner.title!,
                          style: AppStyle.carouselText.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          banner.description!,
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
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: banners.asMap().entries.map((entry) {
                  return GestureDetector(
                    child: Container(
                      width: bannerController.currentIndex.value == entry.key
                          ? 30.0
                          : 6.0, // Lățimea indicatorului activ
                      height:
                          6.0, // Înălțimea indicatorului (toți indicatorii au aceeași înălțime)
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        color: bannerController.currentIndex.value == entry.key
                            ? Colors.white
                            : const Color.fromRGBO(229, 231, 235,
                                1), // Culoarea pentru paginile inactive
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )),
        // }),
      ],
    );
  }
}
