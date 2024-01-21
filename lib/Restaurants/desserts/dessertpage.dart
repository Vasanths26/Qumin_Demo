import 'package:flutter/material.dart';

import 'dessert.dart';

class Dessertpage extends StatefulWidget {
  const Dessertpage({Key? key}) : super(key: key);

  @override
  State<Dessertpage> createState() => _DessertpageState();
}

class _DessertpageState extends State<Dessertpage> {
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
                "Desserts (4)",
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
            if (_isExpanded) const Dessert(),
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
