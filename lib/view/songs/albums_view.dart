import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/common_widget/album_cell.dart';
import 'package:music_player_app/view/songs/album_details_view.dart';
import 'package:music_player_app/view_model/albums_view_model.dart';

class AlbumsView extends StatefulWidget {
  const AlbumsView({super.key});

  @override
  State<AlbumsView> createState() => _AlbumsViewState();
}

class _AlbumsViewState extends State<AlbumsView> {
  final albumVM = Get.put(AlbumViewModel());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var cellwidth = (media.width - 40.0 - 20.0) * 0.5;

    return Scaffold(
      body: Obx(
        () => GridView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: cellwidth / (cellwidth + 45.0),
            mainAxisSpacing: 10,
          ),
          itemCount: albumVM.allList.length,
          itemBuilder: (context, index) {
            var aObj = albumVM.allList[index];

            return AlbumCell(
              aObj: aObj,
              onPressed: () {
                Get.to(() => const AlbumDetailsView());
              },
              onPressedMenu: (selectIndex) {
                if (kDebugMode) {
                  print(index);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
