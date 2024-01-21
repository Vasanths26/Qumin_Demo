import 'dart:io';

import 'package:app_data/Restaurants/appetizer/appetizer_store.dart';
// import 'package:app_data/api/fetch_api.dart';
import 'package:flutter/material.dart';
import 'package:app_data/Restaurants/appetizer/starterspage.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../res/service.dart';

class AppetizersPage extends StatelessWidget {
  AppetizersPage({Key? key}) : super(key: key) {
    rests.fetchData();
  }

  final store = AppetizerStore();
  final rests = ServiceResData();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Observer(builder: (context) {
            //print("value:${rests.rest}");
            // print("name:${rests.restaurantData?.result.menuCategories}");
            final restaurant = rests.menuCategories;
            try {
              return ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                initiallyExpanded:
                    store.expand(), // Set initial expansion state
                iconColor: Colors.black,
                collapsedIconColor: Colors.black,
                title: Row(
                  children: [
                    Text(
                      "${restaurant[0].categoryName} (${restaurant[0].menuItemsCount})",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    RotationTransition(
                      turns: store.toggleExpand()
                          ? const AlwaysStoppedAnimation(0.0)
                          : const AlwaysStoppedAnimation(0.5),
                    ),
                  ],
                ),
                children: [
                  if (store.toggleExpand())
                    Column(
                      children: [
                        StartersPage(),
                        const Divider(
                          height: 3,
                          color: Color(0x33979ba2),
                          thickness: 0.3,
                        ),
                        StartersPage(),
                        const Divider(
                          height: 3,
                          color: Color(0x33979ba2),
                          thickness: 0.6,
                        ),
                      ],
                    ),
                ],
                onExpansionChanged: (bool expanded) {
                  store.toggleExpand();
                },
              );
            } catch (e) {
              stdout.writeln(e);
              // ignore: avoid_unnecessary_containers
              return Container(
                child: Text(e.toString()),
              );
            }
          }),
        ],
      ),
    );
  }
}
