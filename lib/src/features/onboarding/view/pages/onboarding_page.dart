import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ams_frontend/src/features/onboarding/controllers/onboarding_controller.dart';

import '../widgets/onboarding_widget.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.watch(onboardingConrollerProvider);
    final pageController = PageController();

    ref.listen(onboardingConrollerProvider, (previous, next) {
      next.whenOrNull(completed: () {
        context.goNamed(AppRoute.login.name);
      });
    });

    return onboardingState.when(
      completed: () => Container(),
      notCompleted: (list) => Padding(
        padding: const EdgeInsets.only(bottom: KSizes.s20),
        child: PageView.builder(
          controller: pageController,
          itemCount: list.length,
          itemBuilder: (context, index) => Column(
            children: [
              OnboardingWidget(
                onboarding: list[index],
              ),
              SizedBox(
                width: KSizes.s60,
                height: KSizes.s60,
                child: ElevatedButton(
                  onPressed: () {
                    if (index < list.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(
                          milliseconds: KDuration.milli500,
                        ),
                        curve: Curves.ease,
                      );
                    } else {
                      ref
                          .read(onboardingConrollerProvider.notifier)
                          .compeleteOnboading();
                    }
                  },
                  child: Icon(
                    index < list.length - 1
                        ? Icons.next_plan_outlined
                        : Icons.done_all_rounded,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
