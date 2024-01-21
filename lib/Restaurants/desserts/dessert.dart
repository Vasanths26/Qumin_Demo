import 'package:flutter/material.dart';

class Dessert extends StatefulWidget {
  const Dessert({Key? key}) : super(key: key);

  @override
  State<Dessert> createState() => _DessertState();
}

class _DessertState extends State<Dessert> {
  bool _isExpanded = true;
  @override
  void initState() {
    _isExpanded = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 12, left: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                children: [
                  const Text(
                    "DESSERTS (4)",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff979BA2),
                      fontFamily: 'ProximaNovaA',
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: RotationTransition(
                      turns: _isExpanded
                          ? const AlwaysStoppedAnimation(0)
                          : const AlwaysStoppedAnimation(0.5),
                      child: const Icon(
                        Icons.expand_less,
                        color: Color(0xff313840),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              firstChild: Container(), // Hidden state
              secondChild: SingleChildScrollView(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 130,
                          decoration: const BoxDecoration(
                            color: Color(0xffFFFFFF),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/restuarantphoto/Dish Image.png",
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 18),
                                        child: Image.asset(
                                          "assets/restuarantphoto/Icon.png",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      const SizedBox(
                                        width: 148,
                                        height: 36,
                                        child: Text(
                                          "Hyderabadi Murg Biryani",
                                          style: TextStyle(
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
                                      Image.asset(
                                        "assets/restuarantphoto/Calorie icon.png",
                                        width: 8.250007629394531,
                                        height: 10.484748840332031,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      const Text(
                                        "300 kcal",
                                        style: TextStyle(
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "₹ 1000",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff3B414F),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 86,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                    ],
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
                                    child: const Center(
                                      child: Text(
                                        "20% OFF. Min order ₹1000",
                                        style: TextStyle(
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
                    );
                  },
                ),
              ),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            ),
          ],
        ),
      ),
    );
  }
}
