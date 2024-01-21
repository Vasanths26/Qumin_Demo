// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          child: Container(
            height: 35,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffFEDA75),
                    Color(0xffFA7E1E),
                    Color(0xffD62976),
                    Color(0xff962FBF),
                    Color(0xff4F5BD5),
                  ],
                ),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/instagram.png"),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Follow us on Instagram",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 161,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(151, 151, 151, 0.10),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/Logo.png",
                  color: const Color(0xff979BA2),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Order in and eat what you love with ease. Qmin delivers the most flavourful meals right at your doorstep.",
                  style: TextStyle(
                      color: Color(0xff979BA2),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
