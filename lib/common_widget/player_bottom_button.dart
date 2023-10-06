import 'package:flutter/material.dart';

import '../common/color_extensions.dart';

class PlayerBottomButton extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;

  const PlayerBottomButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: IconButton(
              onPressed: onPressed,
              icon: Image.asset(
                icon,
                color: TColor.primaryText80,
                width: 28,
                height: 28,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(color: TColor.secondaryText, fontSize: 9),
          ),
        ],
      ),
    );
  }
}
