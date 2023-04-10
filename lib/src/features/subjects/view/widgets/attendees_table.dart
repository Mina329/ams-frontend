import 'package:ams_frontend/src/konstants/kcolors.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../konstants/kdoubles.dart';
import '../../../../konstants/kicons.dart';
import '../../../../konstants/kints.dart';
import '../../../auth/models/models.dart';

class AttendeesView extends ConsumerWidget {
  final List<User> attendees;

  const AttendeesView(this.attendees, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return attendees.isEmpty
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
                      KIcons.attendees,
                      color: KColors.purple,
                    ),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text(context.l10n.attendee),
                  ),
                ],
                rows: [
                  for (int i = 0; i < attendees.length; i++)
                    DataRow(
                      cells: [
                        DataCell(Text('${i + 1}'), placeholder: true),
                        DataCell(Text(attendees[i].name)),
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
