import 'package:ams_frontend/src/features/subjects/models/subject_model.dart';
import 'package:ams_frontend/src/konstants/kdoubles.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubjectCard extends ConsumerWidget {
  final Subject subject;
  const SubjectCard(this.subject, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: KElevations.e20,
      shadowColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(KRadiuses.r40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(KPaddings.p30),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: SelectableText(
                      subject.name,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                    ),
                    subtitle: SelectableText(subject.id),
                  ),
                ),
                const Placeholder(),
              ],
            ),
            ListTile(
              title: Text(
                context.l10n.instructor,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              subtitle: SelectableText(subject.instructor.name),
            ),
            ListTile(
              title: Text(
                'time'.hardcoded,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              subtitle: SelectableText(subject.cronExpr.toExprString()),
            ),
          ],
        ),
      ),
    );
  }
}