
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    super.key,
    this.validators,
    required this.name,
    required this.hint,
    this.inputType,
  });

  final List<String? Function(String?)>? validators;
  final TextInputType? inputType;
  final String name;
  final String hint;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool? obscureText;
  late IconData icon;

  @override
  void initState() {
    super.initState();
    if (widget.inputType == null) {
      icon = Icons.text_fields_outlined;
    } else if (widget.inputType == TextInputType.emailAddress) {
      icon = Icons.email_outlined;
    } else if (widget.inputType == TextInputType.visiblePassword) {
      icon = Icons.password_outlined;
      obscureText = true;
    } else {
      icon = Icons.text_fields_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      obscureText: obscureText ?? false,
      style: TextStyle(color: KColors.white),
      validator: FormBuilderValidators.compose([
        ...?widget.validators,
        FormBuilderValidators.required(),
      ]),
      name: widget.name,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        suffixIcon: obscureText == null
            ? null
            : IconButton(
                icon: Icon(
                  obscureText! ? Icons.key_off_outlined : Icons.key_outlined,
                  color: KColors.white,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText!;
                  });
                },
              ),
        icon: Icon(
          icon,
          color: KColors.white,
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: KColors.white,
        ),
        fillColor: KColors.lightCyan,
        focusColor: KColors.lightCyan,
      ),
    );
  }
}
