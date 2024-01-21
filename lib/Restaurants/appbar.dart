// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
// import 'package:app_data/Restaurants/chocolates/chocolatespage.dart';
// import 'package:app_data/Restaurants/appetizer/appetizerspage.dart';
import '../res/res.dart';
// import 'desserts/dessertpage.dart';
// import 'maincourse/maincourse.dart';
// import 'meal_for_one/mealforonepage.dart';

class AppBars extends StatelessWidget {
  AppBars({Key? key}) : super(key: key);
  final globalKey = GlobalKey();
  final height = 156.0;
  final height2 = 50.0;

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                floating: false,
                elevation: 0,
                backgroundColor: Colors.white,
                toolbarHeight: height2,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  final bool isExpanded = height > height2;
                  print(isExpanded);
                  return FlexibleSpaceBar(
                    background: Image.asset('assets/restuarantphoto/Banner.png',
                        fit: BoxFit.cover),
                    titlePadding:
                        const EdgeInsets.only(left: 16, top: 10, bottom: 70),
                    title: isExpanded
                        ? SizedBox(
                            height: 40,
                            width: 40,
                            child: Stack(
                              children: [
                                Image.asset(
                                    "assets/restuarantphoto/ellipse.png"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                      "assets/restuarantphoto/chevron-left.png"),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: height2,
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_back_ios),
                                  iconSize: 30,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "ANUKA",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  );
                }),
                expandedHeight: height,
              ),
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: const SliverAppBar(
                  pinned: false,
                  backgroundColor: Colors.white,
                  excludeHeaderSemantics: false,
                  toolbarHeight: 35,
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    titlePadding:
                        EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
                    title: SizedBox(
                      height: 56,
                      width: 360,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ANUKA",
                              style: TextStyle(
                                color: Color(0xff313840),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              )),
                          SizedBox(
                            height: 4,
                          ),
                          if (true)
                            Text(
                              "TajSats Mumbai",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff3B414F),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverAppBar(
                pinned: true,
                floating: false,
                backgroundColor: Colors.white,
                toolbarHeight: 20,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(left: 12, bottom: 12),
                  title: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 30,
                        padding: const EdgeInsets.only(
                            bottom: 4, left: 12, right: 12, top: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                              height: 12,
                              child: Image.asset(
                                  "assets/restuarantphoto/icon2.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            SizedBox(
                              height: 15,
                              width: 22,
                              child: Text(
                                "Veg",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: const Color(0xff3B414F)
                                        .withOpacity(0.76)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 95,
                        height: 30,
                        padding: const EdgeInsets.only(
                            bottom: 4, left: 12, right: 12, top: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                              height: 12,
                              child: Image.asset(
                                  "assets/restuarantphoto/Icon.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            SizedBox(
                              height: 15,
                              width: 47,
                              child: Text(
                                "Non Veg",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: const Color(0xff3B414F)
                                        .withOpacity(0.76)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Builder(
            builder: (BuildContext context) {
              return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return  DataListPage();
                      },
                      childCount: 1,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
