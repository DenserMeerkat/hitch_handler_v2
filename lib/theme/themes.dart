import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData getTheme(FlexScheme scheme, bool isDark) {
  if (isDark) {
    return FlexThemeData.dark(
      scheme: scheme,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 10,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
    );
  }
  return FlexThemeData.light(
    scheme: scheme,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 40,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
  );
}

final Map<String, FlexScheme> colorSchemes = {
  'blue': FlexScheme.blue,
  'indigo': FlexScheme.indigo,
  // 'hippieBlue': FlexScheme.hippieBlue,
  'aquaBlue': FlexScheme.aquaBlue,
  'brandBlue': FlexScheme.brandBlue,
  'deepBlue': FlexScheme.deepBlue,
  'sakura': FlexScheme.sakura,
  'mandyRed': FlexScheme.mandyRed,
  // 'red': FlexScheme.red,
  // 'redWine': FlexScheme.redWine,
  // 'purpleBrown': FlexScheme.purpleBrown,
  'green': FlexScheme.green,
  'money': FlexScheme.money,
  'jungle': FlexScheme.jungle,
  // 'greyLaw': FlexScheme.greyLaw,
  // 'wasabi': FlexScheme.wasabi,
  // 'gold': FlexScheme.gold,
  'mango': FlexScheme.mango,
  // 'amber': FlexScheme.amber,
  // 'vesuviusBurn': FlexScheme.vesuviusBurn,
  'deepPurple': FlexScheme.deepPurple,
  'ebonyClay': FlexScheme.ebonyClay,
  // 'barossa': FlexScheme.barossa,
  // 'shark': FlexScheme.shark,
  // 'bigStone': FlexScheme.bigStone,
  // 'damask': FlexScheme.damask,
  // 'bahamaBlue': FlexScheme.bahamaBlue,
  // 'mallardGreen': FlexScheme.mallardGreen,
  'espresso': FlexScheme.espresso,
  'outerSpace': FlexScheme.outerSpace,
  // 'blueWhale': FlexScheme.blueWhale,
  // 'sanJuanBlue': FlexScheme.sanJuanBlue,
  // 'rosewood': FlexScheme.rosewood,
  'blumineBlue': FlexScheme.blumineBlue,
  'flutterDash': FlexScheme.flutterDash,
  'materialBaseline': FlexScheme.materialBaseline,
  'verdunHemlock': FlexScheme.verdunHemlock,
  'dellGenoa': FlexScheme.dellGenoa,
  'redM3': FlexScheme.redM3,
  'pinkM3': FlexScheme.pinkM3,
  // 'purpleM3': FlexScheme.purpleM3,
  'indigoM3': FlexScheme.indigoM3,
  // 'blueM3': FlexScheme.blueM3,
  'cyanM3': FlexScheme.cyanM3,
  'tealM3': FlexScheme.tealM3,
  'greenM3': FlexScheme.greenM3,
  'limeM3': FlexScheme.limeM3,
  'yellowM3': FlexScheme.yellowM3,
  'orangeM3': FlexScheme.orangeM3,
  'deepOrangeM3': FlexScheme.deepOrangeM3,
};

FlexScheme getFlexScheme(String colorSchemeName) {
  return colorSchemes[colorSchemeName] ?? FlexScheme.greenM3;
}
