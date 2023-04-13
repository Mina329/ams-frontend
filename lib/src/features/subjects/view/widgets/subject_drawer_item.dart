import 'package:ams_frontend/src/features/subjects/models/subject_model.dart';
import 'package:ams_frontend/src/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubjectDrawerItem extends StatelessWidget {
  final Subject subject;
  const SubjectDrawerItem(this.subject, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(subject.name),
      onTap: () {
        context.goNamed(AppRoutes.subjects, params: {'id': subject.id});
      },
    );
  }
}
