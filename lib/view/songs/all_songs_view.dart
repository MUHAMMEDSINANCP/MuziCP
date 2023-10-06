import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/audio_helpers/player_invoke.dart';
import 'package:music_player_app/common_widget/all_song_row.dart';
import 'package:music_player_app/view_model/all_songs_view_model.dart';

class AllSongsView extends StatefulWidget {
  const AllSongsView({super.key});

  @override
  State<AllSongsView> createState() => _AllSongsViewState();
}

class _AllSongsViewState extends State<AllSongsView> {
  final allVM = Get.put(AllSongsViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: allVM.allList.length,
          itemBuilder: (context, index) {
            var sObj = allVM.allList[index];

            return AllSongRow(
              sObj: sObj,
              isWeb: true,
              onPressed: () {},
              onPressedPlay: () {
                playerPlayProcessDebounce(
                    allVM.allList
                        .map((sObj) => {
                              'id': sObj["id"].toString(),
                              'title': sObj["name"].toString(),
                              'artist': sObj["artists"].toString(),
                              'album': sObj["album"].toString(),
                              'genre': sObj["language"].toString(),
                              'image': sObj["image"].toString(),
                              'url': sObj["downloadUrl"].toString(),
                              'user_id': sObj["artistsId"].toString(),
                              'user_name': sObj["artists"].toString(),
                            })
                        .toList(),
                    index);

                // Get.to(() => const MainPlayerView());
              },
            );
          },
        ),
      ),
    );
  }
}
