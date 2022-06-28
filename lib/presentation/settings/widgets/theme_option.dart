import 'package:flutter/material.dart';
import 'package:flutter_theme_carcasa/presentation/models/app_theme.dart';

class ThemeOption extends StatelessWidget {
  const ThemeOption({
    Key? key,
    this.onTap,
    required this.appTheme,
    this.isSelected = false,
    required this.height,
  }) : super(key: key);

  final VoidCallback? onTap;
  final AppTheme appTheme;
  final bool isSelected;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text('2');
  }
}
