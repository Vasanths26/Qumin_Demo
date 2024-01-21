import 'package:flutter/material.dart';

import '../res/service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: Cart()));
}

class Cart extends StatelessWidget {
  Cart({super.key}) {
    serviceData.fetchData();
  }

  final serviceData = ServiceResData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff3B414F),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 20,
              width: 223.986,
              child: Text(
                "Your Cart",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff313840),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 82,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: const BoxDecoration(
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.home_outlined),
                      Text("Delivery at home"),
                      Spacer(),
                      Text("change"),
                    ],
                  ),
                  Divider(
                    height: 1,
                    color: const Color(0xff1E1E1E14).withOpacity(0.8),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Text("₹ 1000"),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 136,
                        decoration: BoxDecoration(
                          color: const Color(0xff901020),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text("Proceed"),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
