import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/common/widgets/widgets.dart';
import 'package:ams_frontend/src/features/auth/view/controllers/auth_controller.dart';
import 'package:ams_frontend/src/features/home/view/pages/attendee_home_page.dart';
import 'package:ams_frontend/src/features/home/view/pages/instructor_home_page.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (previous, next) {
      next.whenData((authState) => authState.whenOrNull(signed: (_) {
            context.toast(context.l10n.logginSuccess);
          }));
    });
    Map<DateTime, String> eventDescriptions = {
      DateTime.utc(2023, 4, 10): 'Subject 1',
      DateTime.utc(2023, 4, 15): 'Subject 2',
      DateTime.utc(2023, 4, 22): 'Subject 3',
      DateTime.utc(2023, 4, 25): 'Subject 4',
    };

    final authStateAsync = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBarWidget(
        icon: FontAwesomeIcons.house,
        title: context.l10n.homeTitle,
      ),
      drawer: const AppDrawerWidget(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              KColors.gradiant1,
              KColors.gradiant2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          color: KColors.dark50Opacity,
          child: authStateAsync.maybeWhen(
            orElse: () => CircularProgressIndicator(color: KColors.lightBlue),
            data: (authStateAsync) => authStateAsync.when(
              signed: (user) => user.type == UserType.instructor
                  ? const InstructorHomePage()
                  : AttendeeHomePage(eventDescriptions: eventDescriptions),
              unsigned: () => CircularProgressIndicator(color: KColors.lightBlue),
            ),
          ),
        ),
      ),
    );
  }
}
