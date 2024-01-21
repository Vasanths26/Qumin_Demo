import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'card_store.dart';

class Cardview extends StatelessWidget {
  Cardview({super.key}) {
    cardStore.loadCardFromJson();
  }

  final cardStore = CardStore();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Observer(builder: (context) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cardStore.card.length,
          itemBuilder: (context, index) {
            final cardData = cardStore.card[index];
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Stack(
                children: [
                  Container(
                    height: 350,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(cardData.imageUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 180),
                      child: Stack(
                        children: [
                          Container(
                            width: 250,
                            height: 65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.only(left: 16, top: 8),
                                    child: Text(cardData.name.toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700))),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                  ),
                                  child: Text(
                                      cardData.channelDescription.toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 157),
                    child: Image(image: AssetImage("assets/image2.png")),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
