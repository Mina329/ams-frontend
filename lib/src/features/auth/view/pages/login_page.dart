import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/view/controllers/auth_controller.dart';
import 'package:ams_frontend/src/konstants/kcolors.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/routing/routing.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignPage extends ConsumerStatefulWidget {
  const SignPage({super.key});

  @override
  ConsumerState<SignPage> createState() => _SignPageState();
}

class _SignPageState extends ConsumerState<SignPage> {
  static final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      next.maybeDataAndReport(
        context,
        (authStateAsync) {
          authStateAsync.whenOrNull(signed: (user) {
            context.goNamedSafe(AppRoute.home.name);
          });
        },
      );
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: KColors.darkBlue,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * KRatios.r025,
              child: CustomPaint(
                painter: RPSCustomPainter(),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: KSizes.s60),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                context.l10n.welcome,
                                style: GoogleFonts.anton(
                                  color: KColors.white,
                                  fontSize: KFontSizes.f60,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * KRatios.r001,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FormBuilderDropdown(
                            validator: FormBuilderValidators.required(),
                            name: context.l10n.loginAs,
                            items: [
                              DropdownMenuItem(
                                value: UserType.attendee,
                                child: Text(
                                  context.l10n.attendee,
                                  style: TextStyle(color: KColors.darkBlue),
                                ),
                              ),
                              DropdownMenuItem(
                                value: UserType.instructor,
                                child: Text(
                                  context.l10n.instructor,
                                  style: TextStyle(color: KColors.darkBlue),
                                ),
                              )
                            ],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(KSizes.s10),
                            ),
                            decoration: InputDecoration(
                              hintText: context.l10n.loginAs,
                              hintStyle: TextStyle(
                                color: KColors.white,
                              ),
                              focusColor: KColors.lightCyan,
                              fillColor: KColors.lightCyan,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: KColors.darkCyan,
                                ),
                              ),
                            ),
                            dropdownColor: KColors.white,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height *
                                KRatios.r004),
                        FormBuilderTextField(
                          style: TextStyle(color: KColors.darkBlue),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.email(),
                            FormBuilderValidators.required(),
                          ]),
                          name: context.l10n.userEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: context.l10n.userEmail,
                            hintStyle: TextStyle(
                              color: KColors.white,
                            ),
                            fillColor: KColors.lightCyan ,
                            focusColor: KColors.lightCyan,
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * KRatios.r001,
                        ),
                        FormBuilderTextField(
                          style: TextStyle(color: KColors.darkBlue),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'please provide a password'),
                          ]),
                          name: context.l10n.password,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: context.l10n.password,
                            hintStyle: TextStyle(
                              color: KColors.white,
                            ),
                            fillColor: KColors.lightCyan,
                            focusColor: KColors.lightCyan,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height *
                                KRatios.r001),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            child: Text(
                              context.l10n.forgotPassword,
                              style: TextStyle(
                                color: KColors.white,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height *
                                KRatios.r004),
                        LoginButtonWidget(formKey: formKey)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
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
      loading: (loading) => CircularProgressIndicator(color: KColors.lightBlue ),
      orElse: () => SizedBox(
        width:
        MediaQuery.of(context).size.width * KRatios.r040,
        height:
        MediaQuery.of(context).size.height * KRatios.r006,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: KColors.darkCyan,
          ),
          onPressed: () => _onPress(context, ref),
          child: Text(context.l10n.login),
        ),
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
