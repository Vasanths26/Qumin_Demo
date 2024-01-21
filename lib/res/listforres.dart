import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'cart_store.dart';

// ignore: must_be_immutable
class ListForRO extends StatelessWidget {
  String img;
  String title;
  String totalCalories;
  String price;
  String offerDetails;
  ListForRO({
    super.key,
    required this.img,
    required this.title,
    required this.totalCalories,
    required this.price,
    required this.offerDetails,
  });
  final cartStore = CartPage();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 130,
            decoration: const BoxDecoration(
              color: Color(0xffFFFFFF),
            ),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(img == ''
                              ? 'https://raw.githubusercontent.com/Lokesh18-shiva/flutter/6824e1898f35a1082ff5502da887cf0a2c46659/Dish%20Image.png'
                              : img))),
                ),
                const SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: Container(
                            color: Colors.amber,
                            height: 12,
                            width: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        SizedBox(
                          width: 148,
                          height: 36,
                          child: Text(
                            title.toString(),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.amber,
                          width: 8.250007629394531,
                          height: 10.484748840332031,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          totalCalories.toString(),
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
                      width: 164,
                      height: 24,
                      child: Row(
                        children: [
                          Text(
                            "₹${price.toString()}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff3B414F),
                            ),
                          ),
                          // const SizedBox(
                          //   width: 20,
                          // ),
                          const Spacer(),

                          Observer(builder: (context) {
                            return cartStore.count == 0
                                ? GestureDetector(
                                    onTap: () {
                                      cartStore.add();
                                    },
                                    child: Container(
                                      width: 86,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
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
                                  )
                                : Container(
                                  height: 25,
                                  width: 90,
                                  padding: const EdgeInsets.only(
                                      bottom: 4,
                                      top: 4,
                                      left: 12,
                                      right: 12),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffAD9189),
                                      borderRadius:
                                          BorderRadius.circular(4)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: cartStore.remove,
                                        child: const Icon(Icons.remove,
                                            size: 12, color: Colors.white),
                                      ),
                                      Text(
                                        cartStore.count.toString(),
                                        style: const TextStyle(
                                            color: Color(0xffF5F6FB),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            fontFamily: "Calibri"),
                                      ),
                                      InkWell(
                                        onTap: cartStore.add,
                                        child: const Icon(
                                          Icons.add,
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                          }),
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
                      child: Center(
                        child: Text(
                          offerDetails == ''
                              ? "20% OFF. Min order ₹1000"
                              : offerDetails.toString(),
                          style: const TextStyle(
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
  }
}
