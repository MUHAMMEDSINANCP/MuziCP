import 'package:flutter/material.dart';
import 'package:music_player_app/common/color_extensions.dart';

class RecommendedCell extends StatelessWidget {
  final Map mObj;

  const RecommendedCell({super.key, required this.mObj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.asset(
                mObj["image"],
                width: double.maxFinite,
                height: 125,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            mObj["name"],
            maxLines: 1,
            style: TextStyle(
              color: TColor.primaryText60,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            mObj["artists"],
            maxLines: 1,
            style: TextStyle(
              color: TColor.secondaryText,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
