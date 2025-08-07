import 'package:bmi_calculator/core/colors_manager.dart';
import 'package:bmi_calculator/core/style_manager.dart';
import 'package:flutter/material.dart';

class GenderSelection extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback tap;
  final bool isSelected;

  const GenderSelection({
    super.key,
    required this.title,
    required this.icon,
    required this.tap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        width: 155,
        height: 180,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.selectedColor
              : Colors.white.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(9)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 80),
            const SizedBox(height: 10),
            Text(title, style: StyleManager.secondryStyle),
          ],
        ),
      ),
    );
  }
}
