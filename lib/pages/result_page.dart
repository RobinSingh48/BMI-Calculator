import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/components/custom_button.dart';
import 'package:bmi_calculator/components/result_container.dart';
import 'package:bmi_calculator/theme/theme_util.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final BmiCalculator bmiCalculator;
  const ResultPage({super.key, required this.bmiCalculator});

  @override
  Widget build(BuildContext context) {
    final bmiValue = bmiCalculator.calculateBmi();
    final bmiResult = bmiCalculator.getResult();
    final suggestion = bmiCalculator.suggestions();
    return Scaffold(
      backgroundColor: context.surface,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              "Your Result",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ResultContainer(
              bmi: bmiValue,
              result: bmiResult,
              suggestion: suggestion,
            ),
          ),
          CustomButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonName: "RE-CALCULATE",
          ),
        ],
      ),
    );
  }
}
