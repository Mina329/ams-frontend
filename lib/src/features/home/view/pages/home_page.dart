import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/common/widgets/widgets.dart';
import 'package:ams_frontend/src/features/auth/view/controllers/auth_controller.dart';
import 'package:ams_frontend/src/features/auth/view/widgets/sigend_builder.dart';
import 'package:ams_frontend/src/features/home/view/pages/attendee_home_page.dart';
import 'package:ams_frontend/src/features/home/view/pages/instructor_home_page.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// TODO: use the pdf package to generate subjects table
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (previous, next) {
      next.whenData((authState) => authState.whenOrNull(signed: (_) {
            context.toast(context.l10n.logginSuccess);
          }));
    });
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
          width: double.infinity,
          child: SignedBuilder(
            builder: (user) => user.type == UserType.instructor
                ? InstructorHomePage(user.id)
                : AttendeeHomePage(user.id),
          ),
        ),
      ),
    );
  }
}
