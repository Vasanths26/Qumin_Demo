import 'package:flutter/material.dart';

class StartersPage extends StatefulWidget {
  const StartersPage({Key? key}) : super(key: key);

  @override
  _StartersPageState createState() => _StartersPageState();
}

class _StartersPageState extends State<StartersPage> {
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _isExpanded = true; // Set initial expansion state here
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTile(
          initiallyExpanded: _isExpanded,
          maintainState: true,
          iconColor: Colors.black,
          collapsedIconColor: Colors.black,
          title: Row(
            children: [
              const Text(
                "STARTER (2)",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'ProximaNovaA',
                ),
              ),
              const Spacer(),
              RotationTransition(
                turns: _isExpanded
                    ? const AlwaysStoppedAnimation(0)
                    : const AlwaysStoppedAnimation(0.5),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
          children: [
            if (_isExpanded)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                              "assets/restaurantImage/Dish Image.png",
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
                                        "assets/restaurantImage/Icon.png",
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
                                      "assets/restaurantImage/Calorie icon.png",
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
          ],
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
