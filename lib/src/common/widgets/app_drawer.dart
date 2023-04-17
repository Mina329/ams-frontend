import 'package:ams_frontend/src/features/auth/view/controllers/auth_controller.dart';
import 'package:ams_frontend/src/features/subjects/providers/providers.dart';
import 'package:ams_frontend/src/features/subjects/view/widgets/subject_drawer_item.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/routing/routing.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeaderWidget(),
          SingleChildScrollView(
            child: Column(
              children: const [
                DrawerSubjectsList(),
                SizedBox(height: KSizes.s30),
                DrawerItemsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerSubjectsList extends ConsumerWidget {
  const DrawerSubjectsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjects = ref.watch(userSubjectsProvider);

    return ExpansionTile(
      tilePadding: const EdgeInsets.only(right: KSizes.s20),
      title: ListTile(
        leading: const Icon(KIcons.subject),
        title: Text(context.l10n.subjects),
        subtitle: subjects.whenOrNull(
          loading: () => const LinearProgressIndicator(),
        ),
      ),
      children: [
        ...?subjects.whenOrNull(
          data: (subjects) =>
              [for (var subject in subjects) SubjectDrawerItem(subject)],
        ),
      ],
    );
  }
}

class DrawerHeaderWidget extends ConsumerWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authControllerProvider);

    return authStateAsync.maybeWhen(
      data: (authState) => Container(
        height: KSizes.s50 * 4,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: KColors.purple,
              radius: KSizes.s30,
              child: const Icon(
                FontAwesomeIcons.houseFloodWater,
                size: KSizes.s20,
              ),
            ),
            const SizedBox(height: KSizes.s20),
            authState.maybeWhen(
              orElse: () => const SizedBox(),
              signed: (user) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        user.name,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                      ),
                      const SizedBox(height: KSizes.s05),
                      Text(
                        user.email,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white60),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(authControllerProvider.notifier).logout();
                    },
                    icon: Icon(
                      KIcons.logout,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      orElse: () => const CircularProgressIndicator(),
    );
  }
}

enum DrawerItem {
  home.route(KIcons.home),
  settings.route(KIcons.settings),
  about(KIcons.about);

  const DrawerItem.route(this.icon);
  const DrawerItem(this.icon);

  final IconData icon;

  void call(BuildContext context) {
    switch (this) {
      case DrawerItem.home:
        context.replaceNamed(AppRoutes.home);
        break;
      case DrawerItem.settings:
        context.goNamed(AppRoutes.settings);
        break;
      case DrawerItem.about:
        showAboutDialog(context: context);
        break;
    }
  }
}

extension DrawerItemL10n on DrawerItem {
  String l10n(BuildContext context) {
    switch (this) {
      case DrawerItem.home:
        return context.l10n.homeDrawerItem;
      case DrawerItem.settings:
        return context.l10n.settingsDrawerItem;
      case DrawerItem.about:
        return context.l10n.aboutDrawerItem;
    }
  }
}

class DrawerItemsList extends StatelessWidget {
  const DrawerItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var item in DrawerItem.values)
          ListTile(
            leading: Icon(item.icon),
            title: Text(item.l10n(context)),
            onTap: () => item.call(context),
          )
      ],
    );
  }
}
