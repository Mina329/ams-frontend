import 'package:ams_frontend/src/features/auth/view/controllers/auth_controller.dart';
import 'package:ams_frontend/src/konstants/kdoubles.dart';
import 'package:ams_frontend/src/routing/routing.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/models.dart';

class SignedBuilder extends StatelessWidget {
  const SignedBuilder({
    super.key,
    required this.builder,
    this.withUnsignedScaffold = false,
  });

  final bool withUnsignedScaffold;
  final Widget Function(User user) builder;

  @override
  Widget build(BuildContext context) {
    Widget unsignedBuild() => Center(
          child: InkWell(
            onTap: () {
              context.goNamed(AppRoute.login.name);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(KPaddings.p10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.login_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      'YOU ARE NOT LOGGED IN'.hardcoded,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

    return AsyncDataBuilder(
      withErrorScaffold: withUnsignedScaffold,
      withLoadingScaffold: withUnsignedScaffold,
      provider: authControllerProvider,
      builder: (AuthState authState) => authState.when(
        signed: (user) => builder(user),
        unsigned: () => withUnsignedScaffold
            ? Scaffold(
                body: unsignedBuild(),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              )
            : unsignedBuild(),
      ),
    );
  }
}
