import 'package:flutter/material.dart';
import 'package:music_player_app/common/color_extensions.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Container(
      width: media.width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
        color: TColor.primaryText60,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "About Us",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: TColor.darkGray.withOpacity(0.7),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            endIndent: 6,
            height: 5,
            color: TColor.darkGray.withOpacity(0.6),
            indent: 6,
            thickness: 1.5,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Welcome to CP Technologies -",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: TColor.darkGray,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Where Innovation Meets Excellence!!\n  At CP Technologies, we are passionate about creating cutting-edge mobile applications that enrich the lives of our users.",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: TColor.darkGray,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Text(
            "    The MuziCP application is a testament to our commitment to delivering high-quality software solutions for Android and iOS.",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: TColor.darkGray,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "CP Technologies was born out of a vision to redefine the mobile app experience. With a focus on user-centric design and functionality, we embarked on a mission to craft intuitive and feature-rich applications that make a difference.",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: TColor.darkGray,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "📧Developer Contact : - cpmuhammedsinan@gmail.com",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: TColor.darkGray,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
