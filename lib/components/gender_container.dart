import 'package:bmi_calculator/theme/theme_util.dart';
import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  final IconData icon;
  final String gender;
  final bool isActive;
  final void Function()? onTap;
  const GenderContainer({
    super.key,
    required this.icon,
    required this.gender,
    required this.isActive,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isActive ? Colors.purple : context.onPrimaryContainer,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80),
            Text(
              gender,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
