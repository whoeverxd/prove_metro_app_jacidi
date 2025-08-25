import 'package:flutter/material.dart';

class MinimalButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onSelected;
  final VoidCallback? onUnselected;
  final String? selectedText;
  final String? unselectedText;
  final Color selectedBackground;
  final Color unselectedBackground;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final EdgeInsets padding;
  final bool showBorder;

  const MinimalButton({
    super.key,
    required this.isSelected,
    this.onSelected,
    this.onUnselected,
    this.selectedText,
    this.unselectedText,
    this.selectedBackground = Colors.black,
    this.unselectedBackground = Colors.white,
    this.selectedTextColor = Colors.white,
    this.unselectedTextColor = Colors.black,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor:
        isSelected ? selectedBackground : unselectedBackground,
        foregroundColor:
        isSelected ? selectedTextColor : unselectedTextColor,
        side: showBorder
            ? const BorderSide(color: Colors.black, width: 1)
            : BorderSide.none,
        padding: padding,
      ),
      onPressed: () {
        if (isSelected) {
          if (onUnselected != null) onUnselected!();
        } else {
          if (onSelected != null) onSelected!();
        }
      },
      child: Text(
        isSelected
            ? (selectedText ?? "CANCELAR")
            : (unselectedText ?? "INSCRIBIRSE"),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
