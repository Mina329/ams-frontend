import 'dart:io';

import 'package:ams_frontend/src/common/common.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/attendances_controller.dart';
import '../widgets/attendees_list_view.dart';

class QrScannerPage extends ConsumerStatefulWidget {
  const QrScannerPage(this.subjectId, {super.key});

  static route(String subjectId) => MaterialPageRoute(
        builder: (context) => QrScannerPage(subjectId),
      );

  final String subjectId;

  @override
  ConsumerState<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends ConsumerState<QrScannerPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AsyncDataBuilder(
          provider: attendancesControllerProvider,
          builder: (AttendancesState attendanceState) => Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(KPaddings.p40),
                  child: Material(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: KElevations.e10,
                    borderRadius: BorderRadius.circular(KRadiuses.r40),
                    color: Colors.transparent,
                    child: LayoutBuilder(
                      builder: (context, constraints) => QRView(
                        key: qrKey,
                        onQRViewCreated: _onQRViewCreated,
                        overlay: QrScannerOverlayShape(
                          borderRadius: KRadiuses.r20,
                          borderWidth: KPaddings.p10,
                          cutOutSize: constraints.maxWidth * 0.75,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: attendanceState.when(
                  init: () => Container(),
                  taken: (attendee) => AttendeeRecord(attendee.attendee),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      setState(() async {
        ref.read(attendancesControllerProvider.notifier).takeAttendance(
              subjectId: widget.subjectId,
              attendeeId: scanData.code!,
            );
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
