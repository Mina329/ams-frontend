import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ams_frontend/src/features/onboarding/view/controllers/onboarding_controller.dart';

import '../../../../konstants/kcolors.dart';
import '../widgets/onboarding_widget.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.watch(onboardingConrollerProvider);
    final pageController = PageController();

    ref.listen(onboardingConrollerProvider, (previous, next) {
      next.whenOrNull(completed: () {
        context.goNamedSafe(AppRoute.login.name);
      });
    });

    return onboardingState.maybeWhen(
      orElse: () => Container(),
      notCompleted: (onboardingList) => Padding(
        padding: const EdgeInsets.only(bottom: KSizes.s20),
        child: Container(
          height: MediaQuery.of(context).size.height,
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
          child: PageView.builder(
            controller: pageController,
            itemCount: onboardingList.length,
            itemBuilder: (context, index) => Column(
              children: [
                OnboardingWidget(
                  onboarding: onboardingList[index],
                ),
                SizedBox(
                  width: KSizes.s60,
                  height: KSizes.s60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (index < onboardingList.length - 1) {
                        pageController.nextPage(
                          duration: const Duration(
                            milliseconds: KDurations.milli500,
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
                      index < onboardingList.length - 1
                          ? Icons.next_plan_outlined
                          : Icons.done_all_rounded,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * KRatios.r006,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
