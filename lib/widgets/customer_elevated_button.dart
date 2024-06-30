import 'package:flutter/material.dart';

class ButtonData {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  ButtonData({required this.text, required this.icon, required this.onPressed});
}

class CustomElevatedButtonRow extends StatelessWidget {
  final List<ButtonData> buttons;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final AlignmentGeometry iconAlignment;

  const CustomElevatedButtonRow({
    super.key,
    required this.buttons,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.alignment = Alignment.center,
    this.iconAlignment = Alignment.centerRight,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Container(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buttons
              .map(
                (button) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ElevatedButton(
                    onPressed: button.onPressed,
                    style: ElevatedButton.styleFrom(
                      alignment: alignment,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(button.text),
                        Align(
                          alignment: iconAlignment,
                          child: Icon(button.icon),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
