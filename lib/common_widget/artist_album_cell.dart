import 'package:flutter/material.dart';
import 'package:music_player_app/common/color_extensions.dart';

class ArtistAlbumCell extends StatelessWidget {
  final Map aObj;

  const ArtistAlbumCell({super.key, required this.aObj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.asset(
                aObj["image"],
                width: double.maxFinite,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            aObj["name"],
            maxLines: 1,
            style: TextStyle(
              color: TColor.primaryText60,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            aObj["year"],
            maxLines: 1,
            style: TextStyle(
              color: TColor.primaryText35,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
