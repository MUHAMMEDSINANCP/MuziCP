import 'package:flutter/material.dart';

import '../common/color_extensions.dart';

class IconTextRow extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final double optionalHeightforTiles;
  const IconTextRow({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.optionalHeightforTiles = 44,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: optionalHeightforTiles,
          child: ListTile(
            leading: Image.asset(
              icon,
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: TColor.primaryText.withOpacity(0.9),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: onTap,
          ),
        ),
        Divider(
          color: TColor.primaryText.withOpacity(0.07),
          indent: 70,
        ),
      ],
    );
  }
}
