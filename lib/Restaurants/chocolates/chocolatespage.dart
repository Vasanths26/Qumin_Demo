import 'package:flutter/material.dart';

import 'chocolates2page.dart';

class ChocolatesPages extends StatefulWidget {
  const ChocolatesPages({Key? key}) : super(key: key);

  @override
  State<ChocolatesPages> createState() => _ChocolatesPagesState();
}

class _ChocolatesPagesState extends State<ChocolatesPages> {
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
                "Chocolates (19)",
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
            if (_isExpanded) const ChocolatesPage2(),
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
