import 'package:flutter/material.dart';

class SelectedThemeIndicator extends StatelessWidget {
  const SelectedThemeIndicator({
    Key? key,
    this.selectedThemeIndex = 0,
    required this.width,
  }) : super(key: key);

  final int selectedThemeIndex;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Text('2');
  }
}
