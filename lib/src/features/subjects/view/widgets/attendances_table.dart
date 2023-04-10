import 'package:ams_frontend/src/konstants/kcolors.dart';
import 'package:ams_frontend/src/konstants/kints.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../konstants/kdoubles.dart';
import '../../../../konstants/kicons.dart';
import '../../models/attendance_model.dart';

class AttendancesView extends ConsumerWidget {
  final List<Attendance> attendances;

  const AttendancesView(this.attendances, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return attendances.isEmpty
        ? Align(
            alignment: Alignment.center,
            child: Text(context.l10n.noRecordFound,
                style: TextStyle(
                    color: KColors.white,
                    fontSize: KFontSizes.f20,
                    fontWeight: FontWeight.w600)),
          )
        : Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Icon(
                      KIcons.attendances,
                      color: KColors.purple,
                    ),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text(context.l10n.attendee),
                  ),
                  DataColumn(
                    label: Text('Time'.hardcoded),
                  ),
                ],
                rows: [
                  for (int i = 0; i < attendances.length; i++)
                    DataRow(
                      cells: [
                        DataCell(Text('${i + 1}'), placeholder: true),
                        DataCell(Text(attendances[i].attendee.name)),
                        DataCell(Text(
                            "${attendances[i].createAt.year}-${attendances[i].createAt.month}-${attendances[i].createAt.day} ${attendances[i].createAt.hour}:${attendances[i].createAt.minute}")),
                      ],
                    )
                ],
                border: TableBorder.all(
                  borderRadius: BorderRadius.circular(KRadiuses.r50),
                ),
                headingRowColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) => KColors.lightCyan),
                headingTextStyle:
                    TextStyle(color: KColors.purple, fontSize: KFontSizes.f20),
                clipBehavior: Clip.antiAlias,
                headingRowHeight: KSizes.s50,
                dataRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.transparent.withAlpha(KAlphas.a50)),
                dataTextStyle:
                    TextStyle(color: KColors.white, fontSize: KFontSizes.f15),
              ),
            ),
          );
  }
}
