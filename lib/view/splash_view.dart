import 'package:flutter/material.dart';
 import 'package:get/get.dart';
import 'package:music_player_app/view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final splashVM = Get.put(SplashViewModel());

  @override
  void initState() {
    // to disable status bar use the below code
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
    splashVM.loadView();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/img/app_logo.png",
          width: media.width * 0.30,
        ),
      ),
    );
  }
}
