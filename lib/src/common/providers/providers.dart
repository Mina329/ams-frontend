import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pdf/widgets.dart' as pw;

export './provider_observer.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
List<CameraDescription> cameras(CamerasRef ref) {
  throw UnimplementedError();
}

@riverpod
Future<Uint8List> qrcode(QrcodeRef ref, String data) async {
  final doc = pw.Document();
  doc.addPage(
    pw.Page(
      build: (context) =>
          pw.BarcodeWidget(barcode: pw.Barcode.qrCode(), data: data),
    ),
  );

  return await doc.save();
}
