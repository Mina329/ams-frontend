import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../konstants/kcolors.dart';
import '../../../../konstants/kdoubles.dart';
import '../../providers/providers.dart';
import '../widgets/home_widget.dart';

class AttendeeHomePage extends ConsumerWidget {
  const AttendeeHomePage(this.attendeeId, {Key? key}) : super(key: key);

  final String attendeeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventDescriptionsAsync = ref.watch(
      eventDescriptionsProvider(limit: 10),
    );

    return Padding(
      padding: const EdgeInsets.all(KPaddings.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            context.l10n.subjectCalendar,
            style: TextStyle(
              fontSize: KSizes.s25,
              color: KColors.white,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * KRatios.r004,
          ),
          eventDescriptionsAsync.maybeWhen(
            orElse: () => const CircularProgressIndicator(),
            data: (eventDescriptions) => Calender(
              eventDescriptions: eventDescriptions,
            ),
          ),
        ],
      ),
    );
  }
}
