// ignore_for_file: library_private_types_in_public_api

import 'package:app_data/Restaurants/appetizer/appetizer_store.dart';
import 'package:app_data/res/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StartersPage extends StatelessWidget {
  StartersPage({Key? key}) : super(key: key) {
    serviceData.fetchData();
  }

  final store = AppetizerStore();
  final serviceData = ServiceResData();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Observer(builder: (context) {
          return ExpansionTile(
            initiallyExpanded: store.expand(),
            maintainState: true,
            iconColor: Colors.black,
            collapsedIconColor: Colors.black,
            title: Row(
              children: [
                Text(
                  serviceData.dishtype[0].dishTypeName.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'ProximaNovaA',
                  ),
                ),
                const Spacer(),
                RotationTransition(
                  turns: store.expand()
                      ? const AlwaysStoppedAnimation(0)
                      : const AlwaysStoppedAnimation(0.5),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
            children: [
              if (store.expand())
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: serviceData.dishtype.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 130,
                            decoration: const BoxDecoration(
                              color: Color(0xffFFFFFF),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 130,
                                  width: 156,
                                  child: Image.network(
                                    serviceData.menuItems[index].plpImageUrl,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 18),
                                          child: Image.asset(
                                            "assets/restaurantImage/Icon.png",
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        SizedBox(
                                          width: 148,
                                          height: 36,
                                          child: Text(
                                            serviceData.menuItems[index].title,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff3B414F),
                                            ),
                                            textAlign: TextAlign.left,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/restaurantImage/Calorie icon.png",
                                          width: 8.250007629394531,
                                          height: 10.484748840332031,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "${serviceData.menuItems[index].totalCalories.value} ${serviceData.menuItems[index].totalCalories.unit}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff3B414F),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      height: 24,
                                      width: 164,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "₹ ${serviceData.menuItems[index].price}",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff3B414F),
                                            ),
                                          ),
                                          Container(
                                            width: 86,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                width: 2,
                                                color: const Color(0xffAD9189),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "ADD",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                  color: Color(0xffAD9189),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    Container(
                                      width: 164,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        gradient: const RadialGradient(
                                          colors: [
                                            Color(0xffEC6978),
                                            Color(0xffD95565),
                                          ],
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "20% OFF. Min order ₹1000",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Divider(
                            color: Colors.blueGrey,
                            thickness: 0.3,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    );
                  },
                ),
            ],
            onExpansionChanged: (bool expanded) {
              store.toggleExpand();
            },
          );
        }),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
