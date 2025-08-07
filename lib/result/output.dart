import 'package:bmi_calculator/core/style_manager.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final Map<String, dynamic> result;

  const ResultPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21), // Dark background
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        elevation: 0,
        title: Text("BMI Calculator", style: StyleManager.mainStyle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Your Result",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1D1E33), // Card color
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      result['category'],
                      style: TextStyle(
                        color: Colors.greenAccent[400],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      result['bmi'],
                      style: StyleManager.numbers = StyleManager.numbers
                          .copyWith(fontSize: 80),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      _getDescription(result['category']),
                      style: StyleManager.secondryStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pop(context); // Go back to InputScreen
          },
          child: const Text(
            "Re - Calculate",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  String _getDescription(String category) {
    switch (category) {
      case "Underweight":
        return "You are under the normal weight. Consider eating more nutritious food.";
      case "Normal":
        return "You have a Normal Body Weight. Good Job.";
      case "Overweight":
        return "You are slightly overweight. Consider a healthier lifestyle.";
      case "Obese":
        return "Your BMI indicates obesity. Please consult a healthcare provider.";
      default:
        return "No description available.";
    }
  }
}
