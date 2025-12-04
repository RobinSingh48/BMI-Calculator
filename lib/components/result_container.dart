import 'package:bmi_calculator/helper/result_color.dart';
import 'package:bmi_calculator/theme/theme_util.dart';
import 'package:flutter/material.dart';

class ResultContainer extends StatelessWidget {
  final String bmi;
  final String result;
  final String suggestion;
  const ResultContainer({
    super.key,
    required this.bmi,
    required this.result,
    required this.suggestion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: context.onPrimaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              result,
              style: TextStyle(
                color: getResultColor(result),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Spacer(),
          Text(
            bmi,
            style: TextStyle(
              color: getResultColor(result),
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              suggestion,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
