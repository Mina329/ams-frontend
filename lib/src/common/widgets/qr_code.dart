import 'dart:typed_data';

import 'package:ams_frontend/src/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QrCode extends ConsumerWidget {
  const QrCode(this.data, {super.key});

  final String data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: GenericAsyncBuilder(
        provider: qrcodeProvider(data),
        data: (Uint8List data) => PDFView(pdfData: data),
      ),
    );
  }
}
