// ignore_for_file: avoid_print, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'banner_store.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class BannersWidget extends StatelessWidget {
  final BannerStore store = BannerStore();
  final CarouselController _controller = CarouselController();
  BannersWidget({super.key}) {
    store.loadBannersFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Container(
        height: 240,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xffFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 200,
              height: 23,
              child: Text(
                'In the Spotlight',
                style: TextStyle(
                  color: Color(0xff3B414F),
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 164,
              width: MediaQuery.of(context).size.width,
              child: Observer(
                builder: (_) {
                  return CarouselSlider(
                    items: store.banners.map((imagePath) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          imagePath.imageUrl as String,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      onPageChanged: (index, reason) {
                        store.increment(index);
                      },
                    ),
                    carouselController: _controller,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Observer(
                builder: (_) {
                  if (store.banners.isEmpty) {
                    return Container(); // Return an empty container if banners are empty.
                  }

                  return DotsIndicator(
                    dotsCount: store.banners.length,
                    position: store.currentIndex,
                    decorator: DotsDecorator(
                      color: const Color(0xff90102033).withOpacity(0.2),
                      activeColor: const Color(0xff901020),
                      size: const Size(8, 8),
                      activeSize: const Size(8, 8),
                      spacing: const EdgeInsets.all(4),
                    ),
                    onTap: (position) {
                      _controller.nextPage();
                      _controller.previousPage();
                      store.increment(position);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
