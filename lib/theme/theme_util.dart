import 'package:flutter/material.dart';

extension ThemeUtil on BuildContext {
  Color get onPrimaryContainer => Theme.of(this).colorScheme.onPrimaryContainer;
  Color get surface => Theme.of(this).colorScheme.surface;
  Color get secondary => Theme.of(this).colorScheme.secondary;
  Color get inversePrimary => Theme.of(this).colorScheme.inversePrimary;
}
