import 'package:bmi_calculator/theme/theme_util.dart';
import 'package:flutter/material.dart';

class WeightAgeContainer extends StatelessWidget {
  final Function(int) onValueChange;
  final String label;
  final List<int> list;
  final int selectedValue;
  const WeightAgeContainer({
    super.key,
    required this.onValueChange,
    required this.label,
    required this.list,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    int selectedIndex = list.indexOf(selectedValue);
    return Container(
      height: 220,
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.onPrimaryContainer,
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: context.secondary,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: FixedExtentScrollController(
                initialItem: selectedIndex,
              ),
              itemExtent: 55,
              diameterRatio: 1.2,
              physics: FixedExtentScrollPhysics(),
              onSelectedItemChanged: (value) {
                onValueChange(list[value]);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        list[index].toString(),
                        style: TextStyle(
                          fontSize: selectedValue == list[index] ? 32 : 22,
                          color: selectedValue == list[index]
                              ? Colors.black
                              : context.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
                childCount: list.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
