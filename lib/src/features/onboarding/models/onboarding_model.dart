import 'package:flutter/material.dart';

@immutable
class Onboarding {
  final String title;
  final String text;
  final String asset;

  const Onboarding(this.title, this.text, this.asset);
}
