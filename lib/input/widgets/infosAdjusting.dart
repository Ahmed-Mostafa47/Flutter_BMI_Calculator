import 'package:flutter/material.dart';
import 'package:bmi_calculator/core/style_manager.dart';

class InfosAdjusting extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const InfosAdjusting({
    super.key,
    required this.title,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 180,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(9)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Text(title, style: StyleManager.secondryStyle),
          const SizedBox(height: 5),
          Text("$value", style: StyleManager.numbers),
          const SizedBox(height: 21),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff8B8C9E),
                ),
                onPressed: onDecrement,
                child: const Text(
                  "-",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 9),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff8B8C9E),
                ),
                onPressed: onIncrement,
                child: const Text(
                  "+",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
