import 'package:flutter/material.dart';

import 'briyanipage.dart';
import 'burgers.dart';
import 'currypage.dart';
import 'dalspage.dart';
import 'indianbreads.dart';
import 'maincoursedish.dart';
import 'pastapage.dart';
import 'ricepage.dart';
import 'rolls_wrapspage.dart';
import 'sandwichespage.dart';

class MainCoursePage extends StatefulWidget {
  const MainCoursePage({Key? key}) : super(key: key);

  @override
  State<MainCoursePage> createState() => _MainCoursePage();
}

class _MainCoursePage extends State<MainCoursePage> {
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
          initiallyExpanded: _isExpanded,
          iconColor: Colors.black,
          title: Row(
            children: [
              const Text(
                "Main Course (28)",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
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
                      ? const AlwaysStoppedAnimation(0.0)
                      : const AlwaysStoppedAnimation(0.5),
                ),
              ),
            ],
          ),
          children: [
            if (_isExpanded)
              const Column(
                children: [
                  CurryPage(),
                  IndianBreads(),
                  BriyaniPage(),
                  DalsPage(),
                  RicePage(),
                  MainCourseDish(),
                  RollsWraps(),
                  BurgersPage(),
                  SandWichesPage(),
                  Pastapage(),
                ],
              ),
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
