import 'dart:io';

import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rxdart/rxdart.dart';

import '../controllers/attendances_controller.dart';

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
    controller.scannedDataStream
        .interval(const Duration(seconds: 1))
        .listen((scanData) async {
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
