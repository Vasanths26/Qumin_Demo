import 'package:flutter/material.dart';

class RestaurantData extends StatelessWidget {
  RestaurantData({Key? key}) : super(key: key);

  final globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 156,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/restaurantImage/Banner.png',
              fit: BoxFit.cover,
            ),
          ),
          floating: true,
          pinned: false,
          // title: SliverAppBarTitle(
          //   targetWidgetKey: globalKey,
          //   child: Container(
          //     width: 328,
          //     height: 40,
          //     padding:
          //         const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
          //     child: const Column(
          //       children: [
          //         Text(
          //           "ANUKA",
          //           style: TextStyle(
          //               fontSize: 16,
          //               color: Color(0xff3B414F),
          //               fontWeight: FontWeight.w700),
          //         ),
          //         Text(
          //           "TajSats Mumbai",
          //           style: TextStyle(
          //             fontSize: 14,
          //             fontWeight: FontWeight.w400,
          //             color: Color(0xff3B414F),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ],
    );
  }
}
