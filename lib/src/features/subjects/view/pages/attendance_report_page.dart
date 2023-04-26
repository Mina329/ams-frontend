import 'package:ams_frontend/src/features/subjects/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceReportPage extends ConsumerWidget {
  const AttendanceReportPage({super.key, required this.pdfData});

  final Uint8List pdfData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// #region ref.watch
    final reportService = ref.watch(attendanceReportServiceProvider);
// #endregion

// #region callbacks
    Future<void> onPrint() async {
      await reportService.print(pdfData);
    }

    Future<void> onShare() async {
      await reportService.share(pdfData);
    }
// #endregion

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: onPrint,
            icon: const Icon(Icons.print_outlined),
          ),
          IconButton(
            onPressed: onShare,
            icon: const Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: PDFView(
        pdfData: pdfData,
      ),
    );
  }
}
