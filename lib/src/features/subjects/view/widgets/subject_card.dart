import 'package:ams_frontend/src/features/subjects/models/subject_model.dart';
import 'package:ams_frontend/src/konstants/kcolors.dart';
import 'package:ams_frontend/src/konstants/kdoubles.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubjectCard extends ConsumerWidget {
  final Subject subject;

  const SubjectCard(this.subject, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * KRatios.r075,
        child: Card(
          elevation: KElevations.e10,
          shadowColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(KRadiuses.r40),
          ),
          child: Padding(
            padding: const EdgeInsets.all(KPaddings.p10),
            child: Column(
              children: [
                Text(
                  subject.name,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: KColors.purple,
                      ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * KRatios.r002,
                ),
                Container(
                  width: 300,
                  height: 300,
                  // TODO : Add Photo
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    context.l10n.instructor,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: KColors.purple),
                  ),
                  subtitle: Text(subject.instructor.name),
                ),
                ListTile(
                  title: Text(
                    'Time'.hardcoded,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: KColors.purple),
                  ),
                  // TODO : ADD TIME
                  subtitle: Text("Tuesday , 5:00 PM"),
                ),
              ],
            ),
          ),
        ));
  }
}
class SubjectInfoView extends ConsumerWidget {
  final Subject subject;

  const SubjectInfoView(this.subject, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [SubjectCard(subject)],
    );
  }
}