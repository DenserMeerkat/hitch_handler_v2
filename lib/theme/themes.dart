import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData getTheme(FlexScheme scheme, bool isDark, double lightBlendLevel,
    double darkBlendLevel) {
  if (isDark) {
    return FlexThemeData.dark(
      scheme: scheme,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: darkBlendLevel.toInt(),
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
    blendLevel: lightBlendLevel.toInt(),
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
  'greenM3': FlexScheme.greenM3,
  'tealM3': FlexScheme.tealM3,
  'materialBaseline': FlexScheme.materialBaseline,
  'cyanM3': FlexScheme.cyanM3,
  'dellGenoa': FlexScheme.dellGenoa,
  'limeM3': FlexScheme.limeM3,
  'indigoM3': FlexScheme.indigoM3,
  'blue': FlexScheme.blue,
  'verdunHemlock': FlexScheme.verdunHemlock,
  'blumineBlue': FlexScheme.blumineBlue,
  'flutterDash': FlexScheme.flutterDash,
  'deepPurple': FlexScheme.deepPurple,
  'red': FlexScheme.red,
  'yellowM3': FlexScheme.yellowM3,

  // Input Prefix Container
  // 'indigo': FlexScheme.indigo,
  // 'deepBlue': FlexScheme.deepBlue,
  // 'redWine': FlexScheme.redWine,
  // 'purpleBrown': FlexScheme.purpleBrown,
  // 'jungle': FlexScheme.jungle,
  // 'greyLaw': FlexScheme.greyLaw,
  // 'wasabi': FlexScheme.wasabi,
  // 'ebonyClay': FlexScheme.ebonyClay,
  // 'barossa': FlexScheme.barossa,
  // 'damask': FlexScheme.damask,
  // 'outerSpace': FlexScheme.outerSpace,
  // 'blueWhale': FlexScheme.blueWhale,

  // OnPrimary - Light in Dark
  // 'mandyRed': FlexScheme.mandyRed,
  // 'shark': FlexScheme.shark,
  // 'bigStone': FlexScheme.bigStone,

  // Teritiary Colors
  // 'hippieBlue': FlexScheme.hippieBlue,
  // 'aquaBlue': FlexScheme.aquaBlue,
  // 'sakura': FlexScheme.sakura,
  // 'mango': FlexScheme.mango,
  // 'amber': FlexScheme.amber,
  // 'vesuviusBurn': FlexScheme.vesuviusBurn,
  // 'espresso': FlexScheme.espresso,
  // 'sanJuanBlue': FlexScheme.sanJuanBlue,
  // 'rosewood': FlexScheme.rosewood,
  // 'purpleM3': FlexScheme.purpleM3,
  // 'blueM3': FlexScheme.blueM3,
  // 'orangeM3': FlexScheme.orangeM3,
  // 'deepOrangeM3': FlexScheme.deepOrangeM3,
};

FlexScheme getFlexScheme(String colorSchemeName) {
  return colorSchemes[colorSchemeName] ?? FlexScheme.greenM3;
}
