import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/view/controllers/auth_controller.dart';
import 'package:ams_frontend/src/features/auth/view/widgets/login_button.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../widgets/login_text_field.dart';

class SignPage extends ConsumerStatefulWidget {
  const SignPage({super.key});

  @override
  ConsumerState<SignPage> createState() => _SignPageState();
}

class _SignPageState extends ConsumerState<SignPage> {
  static final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    ref.onErrorShowModalBottomSheet(authControllerProvider);

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: KColors.darkBlue,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: height * KRatios.r025,
                child: CustomPaint(
                  painter: RPSCustomPainter(),
                ),
              ),
              Center(
                child: FormBuilder(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: KSizes.s60,
                    ),
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
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * KRatios.r001,
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
                                  style: TextStyle(color: KColors.white),
                                ),
                              ),
                              DropdownMenuItem(
                                value: UserType.instructor,
                                child: Text(
                                  context.l10n.instructor,
                                  style: TextStyle(color: KColors.white),
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
                            dropdownColor: KColors.darkCyan,
                          ),
                        ),
                        SizedBox(height: height * KRatios.r004),
                        LoginTextField(
                          name: context.l10n.userEmail,
                          hint: context.l10n.userEmail,
                          inputType: TextInputType.emailAddress,
                          validators: [FormBuilderValidators.email()],
                        ),
                        SizedBox(
                          height: height * KRatios.r001,
                        ),
                        LoginTextField(
                          name: context.l10n.password,
                          hint: context.l10n.password,
                          inputType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: height * KRatios.r001),
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
                          height: height * KRatios.r004,
                        ),
                        LoginButton(formKey: formKey),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
