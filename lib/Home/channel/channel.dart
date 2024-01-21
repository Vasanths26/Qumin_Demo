// ignore_for_file: avoid_print

import 'package:app_data/Home/channel/channel_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ExploreWidget extends StatelessWidget {
  ExploreWidget({Key? key}) : super(key: key) {
    channelStore.loadChannelFromJson();
  }

  final channelStore = ChannelStore();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      child: SizedBox(
        height: 459,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 23,
              width: 100,
              child: Text(
                'Explore',
                style: TextStyle(
                  color: Color(0xff3B414F),
                  // Remove "assets/fonts/" and specify the correct font family
                  fontFamily: 'ProximaNovaA-Thin',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SizedBox(
                height: 420,
                child: Observer(builder: (context) {
                  return GridView.count(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2, // Set the number of columns here
                    children: channelStore.channel.map((channel) {
                      try {
                        return SizedBox(
                          height: 210,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Image.network(
                                      channel.imageUrl!,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Positioned(
                                top: 119,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                        'assets/Wave Pattern.png',
                                        height: 63,
                                        width: 185,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 18, right: 22),
                                          child: SizedBox(
                                            child: Text(channel.name!,
                                                style: const TextStyle(
                                                  fontFamily: "ProximaNovaA",
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 51),
                                          child: SizedBox(
                                            child: Text(channel.minPrice!,
                                                style: const TextStyle(
                                                  fontFamily: "ProximaNovaA",
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } catch (e) {
                        //print(e);
                        return Container(
                          color: Colors.blue,
                          height: 400,
                          width: 400,
                        );
                      }
                    }).toList(),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
