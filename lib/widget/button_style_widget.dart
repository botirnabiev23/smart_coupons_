import 'package:flutter/material.dart';
import 'package:smart_coupons/theme/colors.dart';

class ButtonStyleWidget extends StatelessWidget {
  final String title;
  final double radius;
  final VoidCallback function;
  final double textSize;

  const ButtonStyleWidget({
    super.key,
    required this.title,
    required this.radius,
    required this.function, required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            return primaryColor;
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return primaryColor.withOpacity(0.08);
            }

            return primaryColor.withOpacity(0.05);
          },
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            return Colors.transparent;
          },
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: textSize,
        ),
      ),
    );
  }
}
