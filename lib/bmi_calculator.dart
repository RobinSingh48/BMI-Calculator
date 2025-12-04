import 'dart:math';

class BmiCalculator {
  final int height;
  final int weight;
  late double bmi;
  BmiCalculator({required this.height, required this.weight}) {
    bmi = weight / pow(height/ 100, 2);
  }

  String calculateBmi() {
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi < 18.5) {
      return "Under Weight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Over Weight";
    } else {
      return "Obesity";
    }
  }

  String suggestions() {
    if (bmi < 18.5) {
      return "Too low, you may need more nutrition.";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Nice! Your BMI is normal.";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Higher risk zone. Try to eat healthy and exercise daily.";
    } else {
      return "High-risk range. You should start eating healthy and add exercise to your daily routine.";
    }
  }
}
