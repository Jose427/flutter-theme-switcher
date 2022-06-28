import 'package:flutter/material.dart';

class PrimaryColorOption extends StatelessWidget {
  const PrimaryColorOption({
    Key? key,
    required this.color,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text('1'),
    );
  }
}
