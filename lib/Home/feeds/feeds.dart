// ignore_for_file: avoid_print

import 'package:app_data/Home/qmin_store.dart';

// import 'feeds_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FeedsWidget extends StatelessWidget {
  FeedsWidget({Key? key}) : super(key: key) {
    feedStore.loadFeedsFromJson();
  }

  final feedStore = QminStore();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160,
      color: const Color(0xffFFFFFF),
      padding: const EdgeInsets.only(top: 16, left: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Feeds(),
          const SizedBox(
            width: 16,
          ),
          Flexible(
            child: Observer(builder: (_) {
              final reminder = feedStore.feeds;
              // print("Feeds count: ${reminder.length}");
              try {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: reminder.length - 1,
                  itemBuilder: (context, index) {
                    final item = reminder[index + 1];
                    // print("Feeds count: ${reminder.length}");
                    // print(index);
                    return Row(
                      children: [
                        Container(
                          height: 120,
                          width: 72,
                          color: const Color(0xffFFFFFF),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  width: 72,
                                  height: 72,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xffFEDA75),
                                          Color(0xffFA7E1E),
                                          Color(0xffD62976),
                                          Color(0xff962FBF),
                                          Color(0xff4F5BD5)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: ClipOval(
                                        child: Image(
                                          image: NetworkImage(item.iconUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    color: Color(0xff3B414F),
                                    fontFamily: 'ProximaNovaA-Thin',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        )
                      ],
                    );
                  },
                );
              } catch (e) {
                print(e);
                return Container();
              }
            }),
          ),
        ],
      ),
    );
  }
}

class Feeds extends StatelessWidget {
  Feeds({Key? key}) : super(key: key) {
    feedStore.loadFeedsFromJson();
  }

  final feedStore = QminStore();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (feedStore.feeds.isNotEmpty) {
        final item = feedStore.feeds[0];
        return Container(
          height: 120,
          width: 72,
          color: const Color(0xffFFFFFF),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffFEDA75),
                          Color(0xffFA7E1E),
                          Color(0xffD62976),
                          Color(0xff962FBF),
                          Color(0xff4F5BD5)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: ClipOval(
                        child: Image(
                          image: NetworkImage(item.iconUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  item.name,
                  style: const TextStyle(
                    color: Color(0xff3B414F),
                    fontFamily: 'ProximaNovaA-Thin',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        );
      } else {
        return Container(
          color: Colors.blue,
          height: 120,
          width: 72,
        );
      }
    });
  }
}
