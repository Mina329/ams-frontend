import 'dart:io';

import 'package:ams_frontend/src/common/common.dart';
import 'package:ams_frontend/src/features/auth/models/models.dart';
import 'package:ams_frontend/src/features/subjects/models/models.dart';
import 'package:ams_frontend/src/features/subjects/view/controllers/attendances_controller.dart';
import 'package:ams_frontend/src/features/subjects/view/widgets/floating_action_bubble.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:camera/camera.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../providers/providers.dart';
import '../view.dart';
import '../widgets/attendances_list_view.dart';
import '../widgets/attendee_list_view.dart';
import '../widgets/enrolled_list_view.dart';

// TODO: try sliding_up_panel package
class InstructorSubjectPage extends ConsumerWidget {
  InstructorSubjectPage({Key? key, required this.subjectId}) : super(key: key);

  final String subjectId;
  final navBarKey = GlobalKey<ConvexAppBarState>();
  final pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// #region providers
    final pControllerProvider = attendancesControllerProvider(subjectId);
    final pSubjectProvider = subjectProvider(subjectId);
    final pSubjectAttendancesProvider = SubjectAttendancesProvider(subjectId);
    final pSubjectAttendeesProvider = subjectAttendeesProvider(subjectId);
// #endregion

// #region ref.watch
    final canSubmit = ref.watch(
      pControllerProvider.select((value) => value.attendees.isNotEmpty),
    );
    final subjectAsync = ref.watch(pSubjectProvider);
// #endregion

// #region ref.listen
    ref.listen(pControllerProvider, (previous, next) {
      if (next.isSubmitted) {
        context.toast('submitted attendances successfully');
      }
    });
// #endregion

// #region callbacks
    void Function()? onSubmit;
    if (canSubmit) {
      onSubmit = () async {
        await ref.read(pControllerProvider.notifier).submit();
      };
    }
    Future<void> onTapFaceID() async {
      await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: false,
        elevation: KElevations.e10,
        context: context,
        builder: (context) => CameraAttendance(subjectId),
      );
    }

    Future<void> onTapQrCode() async {
      await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: false,
        elevation: KElevations.e10,
        context: context,
        builder: (context) => QrCodeAttendance(subjectId),
      );
    }
// #endregion

    return Scaffold(
      appBar: AppBar(
        title: Text(
          subjectAsync.maybeWhen(
            orElse: () => context.l10n.subjects,
            data: (data) => data.name,
          ),
        ),
      ),
      drawer: const AppDrawerWidget(),
      floatingActionButton: FloatingActionBubble(
        onTapFaceID: onTapFaceID,
        onTapQrCode: onTapQrCode,
        onTapId: () {},
        onSubmit: onSubmit,
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Theme.of(context).primaryColor,
        key: navBarKey,
        style: TabStyle.react,
        elevation: KElevations.e10,
        gradient: LinearGradient(colors: [
          KColors.darkCyan,
          KColors.lightCyan,
          KColors.darkCyan,
          KColors.lightCyan,
          KColors.darkCyan,
        ]),
        items: [
          TabItem(
            activeIcon: KIcons.about,
            icon: KIcons.about_outline,
            title: context.l10n.info,
          ),
          TabItem(
            activeIcon: KIcons.attendances,
            icon: KIcons.attendances_outline,
            title: context.l10n.attendances,
          ),
          TabItem(
            activeIcon: KIcons.attendees,
            icon: KIcons.attendees_outline,
            title: context.l10n.enrolled,
          ),
          TabItem(
            activeIcon: KIcons.take_attendance,
            icon: KIcons.take_attendance_outline,
            title: context.l10n.attendees,
          ),
        ],
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: KDurations.pageViewNavigation,
            curve: Curves.ease,
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(KPaddings.p10),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            AsyncDataBuilder(
              withRefreshIndicator: true,
              provider: pSubjectProvider,
              data: (Subject subject) => SubjectInfoView(subject),
            ),
            AsyncDataBuilder(
              withRefreshIndicator: true,
              provider: pSubjectAttendancesProvider,
              data: (List<Attendance> attendances) =>
                  AttendancesListView(attendances),
            ),
            AsyncDataBuilder(
              withRefreshIndicator: true,
              provider: pSubjectAttendeesProvider,
              data: (List<User> enrolled) => EnrolledListView(enrolled),
            ),
            AttendeesListView(subjectId),
          ],
        ),
      ),
    );
  }
}

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

class QrCodeAttendance extends ConsumerStatefulWidget {
  const QrCodeAttendance(this.subjectId, {super.key});

  final String subjectId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends ConsumerState<QrCodeAttendance> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;

// #region providers
  late final pStateController = attendancesControllerProvider(widget.subjectId);
// #endregion

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrViewController!.pauseCamera();
    } else if (Platform.isIOS) {
      qrViewController!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderRadius: KRadiuses.r10,
                borderLength: KSizes.s50,
                borderWidth: KSizes.s05,
              ),
            ),
            Positioned(
              bottom: KSizes.s10,
              child: Text(
                'point at a QR Code',
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
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    Utils.logger.d('created QR View');
    controller.scannedDataStream.listen((scanData) async {
      final code = scanData.code;
      if (code != null) {
        await ref.read(pStateController.notifier).takeByQr(attendeeId: code);
      }
    });
  }

  @override
  void dispose() {
    qrViewController?.dispose();
    super.dispose();
  }
}
