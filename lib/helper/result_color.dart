import 'package:flutter/material.dart';

Color getResultColor(String result) {
  switch (result) {
    case "Under Weight":
      return Colors.blue;
    case "Normal":
      return Colors.green;

    case "Over Weight":
      return Colors.orange;

    case "Obesity":
      return Colors.red;

    default:
      return Colors.white;
  }
}
