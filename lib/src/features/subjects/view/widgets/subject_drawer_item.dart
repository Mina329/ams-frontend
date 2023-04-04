import 'package:ams_frontend/src/features/subjects/models/subject_model.dart';
import 'package:ams_frontend/src/routing/routing.dart';
import 'package:flutter/material.dart';

class SubjectDrawerItem extends StatelessWidget {
  final Subject subject;
  const SubjectDrawerItem(this.subject, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(subject.name),
      onTap: () {
        context.goNamedSafe(AppRoute.subjects.name, params: {'id': subject.id});
      },
    );
  }
}
