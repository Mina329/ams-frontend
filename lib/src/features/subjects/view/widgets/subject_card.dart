import 'package:ams_frontend/src/common/env.dart';
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
    final dt = subject.cronExpr.next().time;
    final time = '${context.l10n.dtEEEE(dt)} ${context.l10n.dtjms(dt)}';

    return Card(
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
              height: MediaQuery.of(context).size.height * KRatios.r006,
            ),
            if (subject.instructor != null)
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        context.l10n.instructor,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: KColors.purple),
                      ),
                      subtitle: Text(subject.instructor!.name),
                      trailing: Container(
                        clipBehavior: Clip.antiAlias,
                        width: KSizes.s50,
                        height: KSizes.s50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: Colors.transparent,
                        ),
                        child: subject.instructor?.image != null
                            ? Image.network(
                                '${EnvVars.apiAssets}/${subject.instructor?.image}')
                            : const Icon(
                                Icons.person_outline,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      context.l10n.addedIn,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: KColors.purple),
                    ),
                    subtitle: Text(context.l10n.dtyMMMd(subject.createAt)),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      context.l10n.time,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: KColors.purple),
                    ),
                    subtitle: Text(time),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SubjectInfoView extends ConsumerWidget {
  final Subject subject;

  const SubjectInfoView(this.subject, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: SubjectCard(subject),
    );
  }
}
