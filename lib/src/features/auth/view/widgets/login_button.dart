import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/auth_controller.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authControllerProvider);
    return authStateAsync.maybeMap(
      loading: (loading) => CircularProgressIndicator(color: KColors.lightBlue),
      orElse: () {
        final height = MediaQuery.of(context).size.height;
        return SizedBox(
          width: height * KRatios.r040,
          height: height * KRatios.r006,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: KColors.darkCyan,
            ),
            onPressed: () => _onPress(context, ref),
            child: Text(context.l10n.login),
          ),
        );
      },
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

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = KColors.lightBlue
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.7232857);
    path0.lineTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.quadraticBezierTo(size.width * 0.3810185, size.height * 0.2106571, 0,
        size.height * 0.7232857);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
