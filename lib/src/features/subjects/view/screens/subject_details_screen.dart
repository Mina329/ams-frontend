import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ams_frontend/src/features/subjects/controllers/subject_details_controller.dart';

class SubjectDetailsScreen extends ConsumerWidget {
  final String id;
  const SubjectDetailsScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectDetails = ref.watch(subjectDetailsControllerProvider(id));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: subjectDetails.when(
          data: (data) => Text(data.subject.name),
          error: (error, stackTrace) {
            throw UnimplementedError(); // TODO
          },
          loading: () => const LinearProgressIndicator(),
        ),
      ),
      body: subjectDetails.when(
        data: (data) => Container(),
        error: (error, stackTrace) {
          throw UnimplementedError(); // TODO
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
