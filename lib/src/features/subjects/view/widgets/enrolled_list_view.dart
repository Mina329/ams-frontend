import 'package:ams_frontend/src/common/widgets/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ams_frontend/src/features/auth/models/models.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../view.dart';

class EnrolledListView extends ConsumerStatefulWidget {
  final List<User> enrolled;

  const EnrolledListView(this.enrolled, {super.key});

  @override
  ConsumerState<EnrolledListView> createState() => _EnrolledListViewState();
}

class _EnrolledListViewState extends ConsumerState<EnrolledListView>
    with AutomaticKeepAliveClientMixin {
  late final enrolled = widget.enrolled;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            const SizedBox(height: KSizes.s10),
        itemBuilder: (context, index) =>
            AttendeeRecord(enrolled[index], actions: [
          SlidableAction(
            onPressed: (context) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => QrCode(enrolled[index].id),
                ),
              );
            },
            icon: Icons.qr_code_rounded,
            backgroundColor: KColors.green,
          )
        ]),
        itemCount: enrolled.length,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
