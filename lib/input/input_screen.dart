import 'package:bmi_calculator/core/colors_manager.dart';
import 'package:bmi_calculator/core/style_manager.dart';
import 'package:bmi_calculator/input/widgets/gender_selection.dart';
import 'package:bmi_calculator/input/widgets/infosAdjusting.dart';
import 'package:bmi_calculator/result/output.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String? selectedGender;
  double _height = 150.0;
  int weight = 15;
  int age = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        title: Text("BMI Calculator", style: StyleManager.mainStyle),
        backgroundColor: AppColors.mainColor,
        elevation: 5,
        shadowColor: Colors.black,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GenderSelection(
                title: "Male",
                icon: Icons.male,
                tap: () {
                  setState(() {
                    selectedGender = "Male";
                  });
                },
                isSelected: selectedGender == "Male",
              ),
              GenderSelection(
                title: "Female",
                icon: Icons.female,
                tap: () {
                  setState(() {
                    selectedGender = "Female";
                  });
                },
                isSelected: selectedGender == "Female",
              ),
            ],
          ),
          SizedBox(height: 25),
          Container(
            width: 319,
            height: 189,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              children: [
                SizedBox(height: 27),
                Text("Height", style: StyleManager.secondryStyle),
                SizedBox(height: 6),
                Text('${_height.round()}cm', style: StyleManager.numbers),
                Expanded(
                  child: Slider(
                    activeColor: AppColors.secondryColor,
                    value: _height,
                    min: 100,
                    max: 250,
                    divisions: 150, // This gives 1cm increments
                    label: '${_height.round()}cm',
                    onChanged: (double value) {
                      setState(() {
                        _height = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 29),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfosAdjusting(
                title: "Weight",
                value: weight,
                onIncrement: () {
                  setState(() {
                    weight++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    if (weight > 15) weight--;
                  });
                },
              ),
              InfosAdjusting(
                title: "Age",
                value: age,
                onIncrement: () {
                  setState(() {
                    age++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    if (age > 5) age--;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondryColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(result: calculateBMI()),
              ),
            );
          },

          child: Text("Calculate", style: StyleManager.numbers),
        ),
      ),
    );
  }

  Map<String, dynamic> calculateBMI() {
    double heightInMeters = _height / 100;
    double bmi = weight / (heightInMeters * heightInMeters);

    String category;
    if (bmi < 18.5) {
      category = "Underweight";
    } else if (bmi < 25) {
      category = "Normal";
    } else if (bmi < 30) {
      category = "Overweight";
    } else {
      category = "Obese";
    }

    return {
      "bmi": bmi.toStringAsFixed(1),
      "category": category,
      "age": age,
      "weight": weight,
      "height": _height.round(),
      "gender": selectedGender ?? "Not specified",
    };
  }
}
