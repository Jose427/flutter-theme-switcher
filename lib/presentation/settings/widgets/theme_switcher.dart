import 'package:flutter/material.dart';
import 'package:flutter_theme_carcasa/presentation/providers/theme_provider.dart';
import 'package:flutter_theme_carcasa/presentation/settings/widgets/selected_theme_indicator.dart';
import 'package:flutter_theme_carcasa/presentation/settings/widgets/switcher_container.dart';
import 'package:flutter_theme_carcasa/presentation/settings/widgets/theme_option.dart';
import 'package:flutter_theme_carcasa/presentation/styles/app_themes.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double themeOptionIndicatorWidth =
        (MediaQuery.of(context).size.width - (20 * 4)) /
            AppThemes.appThemeOptions.length;

    double themeSwitcherOptionsHeight = 60;

    return SwitcherContainer(
      title:'Theme',
      content: Text('c'),
    );


  }
}
