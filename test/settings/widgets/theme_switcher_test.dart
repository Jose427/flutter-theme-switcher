import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme_carcasa/presentation/models/app_theme.dart';
import 'package:flutter_theme_carcasa/presentation/providers/theme_provider.dart';
import 'package:flutter_theme_carcasa/presentation/settings/widgets/theme_option.dart';
import 'package:flutter_theme_carcasa/presentation/settings/widgets/theme_switcher.dart';
import 'package:flutter_theme_carcasa/presentation/styles/app_colors.dart';
import 'package:flutter_theme_carcasa/presentation/styles/app_themes.dart';
import 'package:flutter_theme_carcasa/services/storage/storage_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../pump_app.dart';

void main() {
  late ThemeProvider themeProvider;
  late StorageService storageService;

  ThemeMode _defaultThemeMode = ThemeMode.light;

  setUp(() {
    GetIt.I.registerSingleton<StorageService>(MockStorageService());
    storageService = GetIt.I<StorageService>();
    when(() => storageService.get(StorageKeys.primaryColor))
        .thenReturn(AppColors.primary.value);
    when(() => storageService.get(StorageKeys.themeMode))
        .thenReturn(_defaultThemeMode.name);

    themeProvider = ThemeProvider(storageService);
  });

  testWidgets(
    'All app theme options are rendered',
    (WidgetTester tester) async {
      await tester.pumpApp(
        const Material(child: ThemeSwitcher()),
        themeProvider: themeProvider,
      );
      await tester.pumpAndSettle();

      expect(
        find.byType(ThemeOption),
        findsNWidgets(AppThemes.appThemeOptions.length),
      );

      for (AppTheme appTheme in AppThemes.appThemeOptions) {
        expect(
          find.byKey(Key('__${appTheme.mode.name}_theme_option__')),
          findsOneWidget,
        );
      }
    },
  );

  testWidgets(
    'Tapping on theme option changes selectedThemeMode in provider',
    (WidgetTester tester) async {
      expect(themeProvider.selectedThemeMode, equals(_defaultThemeMode));

      await tester.pumpApp(
        const Material(child: ThemeSwitcher()),
        themeProvider: themeProvider,
      );

      await tester.pumpAndSettle();

      const Key darkThemeOptionKey = Key('__dark_theme_option__');
      final darkThemeOptionFinder = find.byKey(darkThemeOptionKey);

      expect(darkThemeOptionFinder, findsOneWidget);

      await tester.tap(darkThemeOptionFinder);
      await tester.pumpAndSettle();
      expect(themeProvider.selectedThemeMode, equals(ThemeMode.dark));
    },
  );

  tearDown(() async {
    await GetIt.I.reset();
  });
}
