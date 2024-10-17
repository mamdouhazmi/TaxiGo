
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families.
class CustomTextStyles {
  /// Body text style
  static TextStyle get bodyLargeBluegray10001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray10001,
      );

  /// Headline text style
  static TextStyle get headlineSmallMedium => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get headlineSmallOnPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w500,
      );

  /// Title text style
  static TextStyle get titleMediumErrorContainer => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
      );

  static TextStyle get titleMediumGray700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray700,
      );

  static TextStyle get titleMediumGray700_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray700,
      );

  static TextStyle get titleMediumOnErrorContainer => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );

  static TextStyle get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
}
