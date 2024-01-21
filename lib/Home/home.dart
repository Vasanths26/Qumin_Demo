import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'footer.dart';
import 'location_store.dart';
import 'textinHome.dart';
import 'banner/banner.dart';
import 'channel/channel.dart';
import 'custom_channel/card.dart';
import 'feeds/feeds.dart';
import 'popular/popular.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    location.fetchLocationDetails();
  }

  final location = LocationStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: "Home", icon: Image.asset('assets/Home.png')),
          BottomNavigationBarItem(
              label: "Support",
              icon: Stack(
                children: [
                  Image.asset(
                    'assets/User-clock.png',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 9, left: 9, bottom: 1, right: 1),
                    child: Image.asset(
                      'assets/Settings.png',
                      width: 14,
                      height: 14,
                    ),
                  ),
                ],
              )),
          BottomNavigationBarItem(
              label: "Account", icon: Image.asset('assets/Ellipse 131.png'))
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff901020),
        toolbarHeight: 76,
        title: Observer(builder: (context) {
          final item = location.locationDetails;
          try {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(bottom: 36),
                    child: Image(
                      image: AssetImage('assets/Location.png'),
                      height: 24,
                      width: 24,
                    )),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 20,
                          child: Text(
                            item[0],
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: "Calibri"),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Image(
                          image: AssetImage('assets/chevron-down.png'),
                          height: 24,
                          width: 24,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SizedBox(
                        height: 21,
                        width: 121,
                        child: Text(
                          "${item[0]},${item[1]},${item[2]}",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Calibri"),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            );
          } catch (e) {
            //print(e);
            return Container(
              color: Colors.blue,
            );
          }
        }),
        actions: const [
          Padding(
              padding: EdgeInsets.only(
                top: 18,
                bottom: 19,
                right: 16,
              ),
              child: Image(
                image: AssetImage(
                  'assets/search.png',
                ),
              ))
        ],
      ),
      body: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeedsWidget(),
              BannersWidget(),
              ExploreWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 8),
                child: TextInField(
                  top: 0,
                  text: 'Eat what you love ',
                  size: 20,
                ),
              ),
              PopularWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextInField(
                  top: 16,
                  text: "Celebrate with Qmin ",
                  size: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, bottom: 8),
                child: Cardview(),
              ),
              const Footer(),
              const SizedBox(
                height: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
