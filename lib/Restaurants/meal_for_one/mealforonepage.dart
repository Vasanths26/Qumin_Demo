import 'package:flutter/material.dart';

import 'setmealpage.dart';

class MealForOnePage extends StatefulWidget {
  const MealForOnePage({Key? key}) : super(key: key);

  @override
  State<MealForOnePage> createState() => _MealForOnePageState();
}

class _MealForOnePageState extends State<MealForOnePage> {
  bool _isExpanded = true;
  @override
  void initState() {
    _isExpanded = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          initiallyExpanded: _isExpanded,
          iconColor: Colors.black,
          title: Row(
            children: [
              const Text(
                "Meal for one (3)",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              RotationTransition(
                turns: _isExpanded
                    ? const AlwaysStoppedAnimation(0.0)
                    : const AlwaysStoppedAnimation(0.5),
              ),
            ],
          ),
          children: [
            if (_isExpanded) const SetMealPage(),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
        ),
      ],
    );
  }
}
