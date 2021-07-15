import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_image_provider/device_image.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yam_stack/src/controller/gallery_state.dart';

import 'my_progress_indicator.dart';

class MyGallery extends StatefulWidget {
  @override
  _MyGalleryState createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  Widget _progress = MyProgressIndicator(containerSize: 10,);
  final GalleryState _galleryState = Get.find<GalleryState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GalleryState>(builder: (controller) {
      return _galleryState.images == null
          ? _progress
          : GridView.count(
        crossAxisCount: 3,
        children: getImages(context, _galleryState),
      );
    });
  }

  List<Widget> getImages(BuildContext context, GalleryState galleryState) {
    return galleryState.images!
        .map((localImage) => InkWell(
      onTap: () async {
        Uint8List bytes = await localImage.getScaledImageBytes(
            galleryState.localImageProvider!, 0.5);

        final String timeInMilli =
        DateTime.now().millisecondsSinceEpoch.toString();
        try {
          final path = join(
              (await getTemporaryDirectory()).path, '$timeInMilli.png');
          File imageFile = File(path)..writeAsBytesSync(bytes);
          Get.back(result: imageFile);
        } catch (e) {}
      },
      child: Image(
        image: DeviceImage(localImage, scale: 0.1),
        fit: BoxFit.cover,
      ),
    ))
        .toList();
  }
}
