import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/components/custom_button.dart';
import 'package:bmi_calculator/components/gender_container.dart';
import 'package:bmi_calculator/components/height_container.dart';
import 'package:bmi_calculator/components/weight_age_container.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<int> weightList = List.generate(111, (i) => i + 40);
  List<int> ageList = List.generate(61, (i) => i + 10);

  String selectedGender = "Male";
  bool isActive = true;
  double height = 173;
  late int weight = 70;
  late int age = 26;

  void toggle(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                "BMI CALCULATOR",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Gender Containers
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GenderContainer(
                    gender: "Male",
                    icon: Icons.boy,
                    isActive: selectedGender == "Male",
                    onTap: () {
                      toggle("Male");
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GenderContainer(
                    gender: "Female",
                    icon: Icons.girl,
                    isActive: selectedGender == "Female",
                    onTap: () {
                      toggle("Female");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            //Height Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: HeightContainer(
                initialHeight: height,
                onHeightChanged: (value) {
                  height = value;
                },
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Age or weight container
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: WeightAgeContainer(
                    label: "WEIGHT",
                    list: weightList,
                    selectedValue: weight,
                    onValueChange: (value) {
                      setState(() {
                        weight = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: WeightAgeContainer(
                    label: "AGE",
                    list: ageList,
                    selectedValue: age,
                    onValueChange: (value) {
                      setState(() {
                        age = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomButton(
              onTap: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    bmiCalculator: BmiCalculator(height: height.toInt(), weight: weight),
                  )),
                );
              },
              buttonName: "Calculate",
            ),
          ],
        ),
      ),
    );
  }
}
