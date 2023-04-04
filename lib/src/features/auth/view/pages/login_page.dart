import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/view/controllers/auth_controller.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/routing/routing.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignPage extends ConsumerWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();

    ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      next.maybeDataAndReport(
        context,
        (authStateAsync) {
          authStateAsync.whenOrNull(signed: (user) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.goNamedSafe(AppRoute.home.name);
            });
          });
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          context.l10n.loginTitle,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: FormBuilder(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: KSizes.s60),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: FormBuilderDropdown(
                      name: context.l10n.loginAs,
                      items: [
                        DropdownMenuItem(
                          value: UserType.attendee,
                          child: Text(context.l10n.attendee),
                        ),
                        DropdownMenuItem(
                          value: UserType.instructor,
                          child: Text(context.l10n.instructor),
                        )
                      ],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(KSizes.s10),
                      ),
                      decoration:
                          InputDecoration(hintText: context.l10n.loginAs),
                    ),
                  ),
                  const SizedBox(height: KSizes.s50),
                  FormBuilderTextField(
                    name: context.l10n.userEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: context.l10n.userEmail,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(KSizes.s10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: KSizes.s20),
                  FormBuilderTextField(
                    name: context.l10n.password,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: context.l10n.password,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(KSizes.s10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: KSizes.s20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Text(
                        context.l10n.forgotPassword,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: KSizes.s20),
                  SizedBox(
                    width: double.infinity,
                    height: KSizes.s40,
                    child: LoginButtonWidget(formKey: formKey),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButtonWidget extends ConsumerWidget {
  const LoginButtonWidget({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authControllerProvider);
    return authStateAsync.maybeMap(
      loading: (loading) => const CircularProgressIndicator(),
      orElse: () => ElevatedButton(
        onPressed: () => _onPress(context, ref),
        child: Text(context.l10n.login),
      ),
    );
  }

  void _onPress(BuildContext context, WidgetRef ref) {
    final formState = formKey.currentState;
    formState?.save();
    if (formState != null && formState.validate()) {
      ref.read(authControllerProvider.notifier).login(
            email: formState.value[context.l10n.userEmail],
            password: formState.value[context.l10n.password],
            userType: formState.value[context.l10n.loginAs],
          );
    }
  }
}