import 'package:flutter/material.dart';
import '../common/color_extensions.dart';

class PlaylistSongCell extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;
  final VoidCallback onPressedPlay;
  const PlaylistSongCell(
      {super.key,
      required this.pObj,
      required this.onPressed,
      required this.onPressedPlay});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          pObj["image"],
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black45,
          width: double.maxFinite,
          height: double.maxFinite,
          // decoration: BoxDecoration(
          //   border: Border.all(color: TColor.primaryText28),
          //   borderRadius: BorderRadius.circular(5),
          //   color: Colors.black45,
          // ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pObj["name"],
                      maxLines: 1,
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      pObj["songs"],
                      maxLines: 1,
                      style: TextStyle(
                        color: TColor.primaryText28,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: onPressedPlay,
                child: Image.asset(
                  "assets/img/play.png",
                  width: 22,
                  height: 22,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
