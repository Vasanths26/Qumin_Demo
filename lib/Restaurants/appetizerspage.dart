import 'package:flutter/material.dart';
import 'package:app_data/Restaurants/starterspage.dart';

class AppetizersPage extends StatefulWidget {
  const AppetizersPage({Key? key}) : super(key: key);

  @override
  State<AppetizersPage> createState() => _AppetizersPageState();
}

class _AppetizersPageState extends State<AppetizersPage> {
  bool _isExpanded = true; // Set this to true for initial expansion

  @override
  void initState() {
    super.initState();
    _isExpanded = true; // Set initial expansion state here
  }

  final List classes = const [
    StartersPage(),
    StartersPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                initiallyExpanded: _isExpanded, // Set initial expansion state
                iconColor: Colors.black,
                collapsedIconColor: Colors.black,
                title: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Row(
                    children: [
                      const Text(
                        "Main Course (1)",
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
                ),
                children: [
                  if (_isExpanded)
                    const Column(
                      children: [
                        StartersPage(),
                        Divider(
                          height: 8,
                          color: Color(0x33979ba2),
                          thickness: 0.3,
                        ),
                        StartersPage(),
                        Divider(
                          height: 8,
                          color: Color(0x33979ba2),
                          thickness: 0.3,
                        ),
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
          ),
        ),
      ),
    );
  }
}
