import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/routing/routing.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          DrawerHeaderWidget(),
          SingleChildScrollView(child: DrawerItemsList()),
        ],
      ),
    );
  }
}

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: KSizes.s50 * 4,
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: KSizes.s30,
            child: Icon(
              FontAwesomeIcons.houseFloodWater,
              size: KSizes.s20,
            ),
          ),
          const SizedBox(height: KSizes.s20),
          Text(
            'username',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: KSizes.s05),
          Text(
            'email@email.com',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white60),
          ),
        ],
      ),
    );
  }
}

enum DrawerItem {
  home.route(FontAwesomeIcons.house, AppRoute.home),
  settings.route(Icons.settings, AppRoute.settings),
  about(FontAwesomeIcons.info);

  const DrawerItem.route(this.icon, this.route);
  const DrawerItem(this.icon) : route = null;

  final IconData icon;
  final AppRoute? route;
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
            onTap: item.route != null
                ? () => context.goNamed(item.route!.name)
                : null,
          )
      ],
    );
  }
}
