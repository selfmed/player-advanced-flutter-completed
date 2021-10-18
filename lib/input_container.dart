import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  final Color color;
  final Widget? child;
  final void Function()? onPress;

  InputContainer({required this.color, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(20),
        child: child,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
