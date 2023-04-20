import 'package:ams_frontend/src/common/common.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/attendances_controller.dart';

class CameraAttendance extends ConsumerStatefulWidget {
  const CameraAttendance(
    this.subjectId, {
    super.key,
  });

  final String subjectId;

  @override
  ConsumerState<CameraAttendance> createState() => _CameraAttendanceState();
}

class _CameraAttendanceState extends ConsumerState<CameraAttendance> {
  late CameraController cameraController;

// #region providers
  late final pControllerProvider = attendancesControllerProvider(
    widget.subjectId,
  );
// #endregion

  @override
  void initState() {
    super.initState();
    cameraController = CameraController(
      ref.read(camerasProvider).first,
      ResolutionPreset.max,
    );
    cameraController.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  Future<void> onDoubleTap() async {
    final image = await cameraController
        .takePicture()
        .then((picture) => picture.readAsBytes())
        .then((bytes) => FlutterImageCompress.compressWithList(
              bytes,
              rotate: 90,
            ));
    ref.read(pControllerProvider.notifier).takeByFace(image: image);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: Container(
        padding: const EdgeInsets.only(
          top: KPaddings.p05,
          left: KPaddings.p05,
          right: KPaddings.p05,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: KColors.white.withAlpha(KAlphas.a100),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(KRadiuses.r50),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(KRadiuses.r50),
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomCenter,
            children: [
              CameraPreview(cameraController),
              Positioned(
                bottom: KSizes.s10,
                child: Text(
                  'please point at a face (double tap)',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: KColors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: const Offset(3.0, 3.0),
                        color: KColors.darkCyan,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
}
