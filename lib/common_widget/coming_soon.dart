import 'package:flutter/material.dart';
import 'package:music_player_app/common/color_extensions.dart';

class ComingSoon extends StatelessWidget {
  final String title;
  const ComingSoon({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: TColor.bg,
          title: Text(
            title,
            style: TextStyle(
              color: TColor.primaryText80,
              fontSize: 22,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/app_logo.png",
                width: 100,
                height: 100,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Coming Soon..! 👻",
                      style: TextStyle(
                          color: TColor.primaryText60,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "More features headed your way! 👻",
                      style: TextStyle(
                          color: TColor.primaryText60,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
