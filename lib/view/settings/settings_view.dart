import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/common_widget/coming_soon.dart';
import 'package:music_player_app/common_widget/icon_text_row.dart';
import 'package:music_player_app/view/settings/about_us.dart';

import '../../common/color_extensions.dart';
import '../../view_model/splash_view_model.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.find<SplashViewModel>().openDrawer();
          },
          icon: Image.asset(
            "assets/img/menu.png",
            width: 25,
            height: 25,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "Settings",
          style: TextStyle(
              color: TColor.primaryText80,
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(children: [
        IconTextRow(
          title: "Display",
          icon: "assets/img/s_display.png",
          onTap: () {
            Get.to(() => const ComingSoon(
                  title: "Display",
                ));
          },
        ),
        IconTextRow(
          title: "Audio",
          icon: "assets/img/s_audio.png",
          onTap: () {
            Get.to(() => const ComingSoon(
                  title: "Audio",
                ));
          },
        ),
        IconTextRow(
          title: "Headset",
          icon: "assets/img/s_headset.png",
          onTap: () {
            Get.to(() => const ComingSoon(
                  title: "Headset",
                ));
          },
        ),
        IconTextRow(
          title: "Lock Screen",
          icon: "assets/img/s_lock_screen.png",
          onTap: () {
            Get.to(() => const ComingSoon(
                  title: "Lock Screen",
                ));
          },
        ),
        IconTextRow(
          title: "Advanced",
          icon: "assets/img/s_menu.png",
          onTap: () {
            Get.to(() => const ComingSoon(
                  title: "Advanced",
                ));
          },
        ),
        IconTextRow(
          title: "Other",
          icon: "assets/img/s_other.png",
          onTap: () {
            Get.to(() => const ComingSoon(
                  title: "Other",
                ));
          },
        ),
        const SizedBox(
          height: 25,
        ),
        Column(
          children: [
            InkWell(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return const AboutUs();
                      });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "About us ",
                      style: TextStyle(
                          color: TColor.focus.withOpacity(0.6),
                          fontWeight: FontWeight.w700),
                    ),
                    Icon(
                      Icons.info,
                      size: 20,
                      color: TColor.focus.withOpacity(0.6),
                    ),
                  ],
                ))
          ],
        ),
      ]),
    );
  }
}
