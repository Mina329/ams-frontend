import 'package:ams_frontend/src/features/subjects/models/models.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubjectEventCardWidget extends StatelessWidget {
  const SubjectEventCardWidget({
    super.key,
    required this.subject,
  });

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              child: Icon(Icons.subject_outlined),
            ),
            Text(subject.name),
            IconButton(
              onPressed: () {
                context.goNamed(AppRoutes.subjects, params: {'id': subject.id});
              },
              color: KColors.lightCyan,
              icon: const Icon(Icons.info_outline),
            )
          ],
        ),
      ),
    );
  }
}
