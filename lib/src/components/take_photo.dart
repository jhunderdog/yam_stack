import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yam_stack/shared/utils/size_config.dart';
import 'package:yam_stack/src/controller/camera_state.dart';

import 'my_progress_indicator.dart';


class TakePhoto extends StatefulWidget {
  const TakePhoto({
    Key? key,
  }) : super(key: key);

  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  Widget _progress = MyProgressIndicator();

  @override
  Widget build(BuildContext context) {
    final CameraState _cameraState = Get.find<CameraState>();
    return GetBuilder<CameraState>(builder: (controller) {
      return Column(
        children: [
          Container(
            width: SizeConfig().screenWidth,
            height: SizeConfig().screenWidth,
            color: Colors.black,
            child: (_cameraState.isReadyToTakePhoto)
                ? _getPreview(_cameraState)
                : _progress,
          ),
          Expanded(
              child: OutlineButton(
                onPressed: () {
                  if (_cameraState.isReadyToTakePhoto) {
                    _attemptTakePhoto(_cameraState, context);
                  }
                },
                shape: CircleBorder(),
                borderSide: BorderSide(color: Colors.black12, width: 20),
              ))
        ],
      );
    });
  }

  Widget _getPreview(CameraState cameraState) {
    return ClipRect(
      child: OverflowBox(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            width: SizeConfig().screenWidth,
            height: SizeConfig().screenWidth / cameraState.controller!.value.aspectRatio,
            child: CameraPreview(cameraState.controller!),
          ),
        ),
      ),
    );
  }

  void _attemptTakePhoto(CameraState cameraState, BuildContext context) async {
    final String timeInMilli = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      final path =
      join((await getTemporaryDirectory()).path, '$timeInMilli.png');
      print(path);
      await cameraState.controller!.takePicture();

      File imageFile = File(path);
      Get.back(result: imageFile);
    } catch (e) {}
  }
}
