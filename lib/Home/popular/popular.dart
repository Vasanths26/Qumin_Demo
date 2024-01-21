import 'package:app_data/Home/popular/popular_model.dart';
import 'package:app_data/Home/popular/popular_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../res/res.dart';

class PopularWidget extends StatelessWidget {
  PopularWidget({super.key}) {
    popularStore.loadPopularFromJson();
  }
  final popularStore = PopularStore();
  @override
  Widget build(
    BuildContext context,
  ) {
    return Builder(builder: (context) {
      return SizedBox(
        child: Observer(builder: (context) {
          return GridView.count(
            primary: false,
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(popularStore.popular.length, (index) {
              PopularModel model = popularStore.popular[index];
              return GestureDetector(
                onTap: () {
                  if (index == popularStore.popular.length - 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DataListPage(img: model.imageUrl,)));
                  }
                },
                child: SizedBox(
                    width: 99,
                    height: 120,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 6, right: 1, top: 4, bottom: 4),
                                  child: Container(
                                      width: 99,
                                      height: 95,
                                      decoration: BoxDecoration(
                                          // color: Color.fromARGB(255, 238, 6, 6),
                                          border: Border.all(
                                              width: 1,
                                              color: const Color(0xffAD9189)),
                                          borderRadius:
                                              BorderRadius.circular(86)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 6,
                                        ),
                                        child: CircleAvatar(
                                            radius: 43.5,
                                            backgroundImage:
                                                NetworkImage(model.iconUrl!)),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 1, right: 6, top: 4, bottom: 4),
                                  child: Container(
                                      width: 99,
                                      height: 95,
                                      decoration: BoxDecoration(
                                          // color: Colors.black,
                                          border: Border.all(
                                              width: 1,
                                              color: const Color(0xffAD9189)),
                                          borderRadius:
                                              BorderRadius.circular(86))),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(model.curationName!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'ProximaNovaA',
                            ))
                      ],
                    )),
              );
            }),
          );
        }),
      );
    });
  }
}
