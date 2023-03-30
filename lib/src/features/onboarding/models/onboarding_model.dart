import 'package:flutter/material.dart';

@immutable
class OnboardingModel {
  final String title;
  final String text;
  final String asset;

  const OnboardingModel(this.title, this.text, this.asset);
}
