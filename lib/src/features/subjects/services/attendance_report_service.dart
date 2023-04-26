import 'package:ams_frontend/src/features/subjects/models/models.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class AttendanceReportService {
  Future<void> share(Uint8List pdfData) async {
    await Printing.sharePdf(bytes: pdfData);
  }

  Future<void> print(Uint8List pdfData) async {
    await Printing.layoutPdf(onLayout: (format) => pdfData);
  }

  Future<Uint8List> generate({
    required Subject subject,
    required List<Attendance> attendances,
  }) async {
    final doc = pw.Document(subject: subject.name, title: 'Attendances');

    final page = pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      footer: (context) => pw.Column(
        children: [
          pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: pw.Text(
              'Page ${context.pageNumber} of ${context.pagesCount}',
              style: pw.Theme.of(context)
                  .defaultTextStyle
                  .copyWith(color: PdfColors.grey),
            ),
          ),
          pw.SizedBox(height: 10),
          _buildFieldValueRow('Subject', subject.name),
          pw.SizedBox(height: 5),
          _buildFieldValueRow('Instructor', subject.instructor.name),
          pw.SizedBox(height: 5),
          _buildFieldValueRow('Date', DateTime.now().yyyyMMddjms()),
        ],
      ),
      build: (context) => [
        _buildContentHeader(),
        _buildAttandanceTable(attendances),
      ],
    );

    doc.addPage(page);

    return await doc.save();
  }

  static const List<String> _tableHeader = [
    'Attendee Name',
    'Attendee Id',
    'Time',
  ];

  pw.Table _buildAttandanceTable(List<Attendance> attendances) {
    return pw.Table.fromTextArray(
      headerCellDecoration: pw.BoxDecoration(
        color: PdfColor.fromHex('#000000AA'),
      ),
      headerStyle: pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
        color: PdfColor.fromHex('#FFFFFFAA'),
      ),
      headers: _tableHeader,
      data: attendances.map((attendance) {
        return [
          attendance.attendee.name,
          attendance.attendee.id,
          attendance.createAt.yyyyMMddjms(),
        ];
      }).toList(),
    );
  }

  pw.Column _buildContentHeader() {
    return pw.Column(
      mainAxisSize: pw.MainAxisSize.min,
      children: [
        pw.Text(
          'Attendance Report',
          style: pw.TextStyle(
            fontSize: KFontSizes.f40,
            fontWeight: pw.FontWeight.bold,
          ),
          textAlign: pw.TextAlign.center,
        ),
        pw.Divider(thickness: 4),
      ],
    );
  }

  pw.Container _buildFieldValueRow(String field, String value) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(KPaddings.p05),
      decoration: pw.BoxDecoration(
        borderRadius: pw.BorderRadius.circular(KRadiuses.r05),
        border: pw.Border.all(width: 3),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text('$field:'),
          pw.Text(value),
        ],
      ),
    );
  }
}
