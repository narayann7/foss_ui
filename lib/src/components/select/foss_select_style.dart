part of 'foss_select.dart';

/// Visual overrides for a single [FossSelect] or [FossMultiSelect]. Every field
/// is optional; a null field falls back to the value the theme resolves. Pass
/// one via `style:` to tweak a one-off without changing the theme for every
/// other select.
///
/// The overrides cover the trigger surface. State-derived colors (the focus
/// ring and invalid border), the popup surface, and the row highlight stay
/// token-driven; to restyle those globally, retheme `FossColors`.
///
/// A taller trigger with a custom resting fill:
///
/// ```dart
/// FossSelect<String>(
///   value: plan,
///   items: items,
///   style: const FossSelectStyle(
///     minHeight: 44,
///     backgroundColor: Color(0xFFF7F7F7),
///   ),
/// );
/// ```
@immutable
class FossSelectStyle {
  /// Creates a set of select overrides. All fields default to null (inherit).
  const FossSelectStyle({
    this.backgroundColor,
    this.foregroundColor,
    this.placeholderColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.minHeight,
    this.textStyle,
    this.shadow,
    this.iconSize,
    this.gap,
  });

  /// Resting fill of the trigger.
  final Color? backgroundColor;

  /// Color of the selected value text in the trigger.
  final Color? foregroundColor;

  /// Color of the placeholder text shown when nothing is picked.
  final Color? placeholderColor;

  /// Resting border color of the trigger.
  final Color? borderColor;

  /// Corner radius of the trigger and popup in logical pixels.
  final double? borderRadius;

  /// Horizontal padding inside the trigger.
  final EdgeInsetsGeometry? padding;

  /// Minimum height of the trigger in logical pixels.
  final double? minHeight;

  /// Style of the value and placeholder text. Its color is ignored; text color
  /// stays token-driven.
  final TextStyle? textStyle;

  /// Drop shadow layers on the resting trigger; empty for none.
  final List<BoxShadow>? shadow;

  /// Size of the trigger chevron and the row indicator in logical pixels.
  final double? iconSize;

  /// Gap between the value text and the chevron in logical pixels.
  final double? gap;

  /// Returns a copy with every non-null field of [other] laid over this one.
  ///
  /// ```dart
  /// const base = FossSelectStyle(minHeight: 36, gap: 8);
  /// const override = FossSelectStyle(gap: 4);
  /// base.merge(override); // minHeight 36 kept, gap becomes 4
  /// ```
  FossSelectStyle merge(FossSelectStyle? other) {
    if (other == null) return this;
    return FossSelectStyle(
      backgroundColor: other.backgroundColor ?? backgroundColor,
      foregroundColor: other.foregroundColor ?? foregroundColor,
      placeholderColor: other.placeholderColor ?? placeholderColor,
      borderColor: other.borderColor ?? borderColor,
      borderRadius: other.borderRadius ?? borderRadius,
      padding: other.padding ?? padding,
      minHeight: other.minHeight ?? minHeight,
      textStyle: other.textStyle ?? textStyle,
      shadow: other.shadow ?? shadow,
      iconSize: other.iconSize ?? iconSize,
      gap: other.gap ?? gap,
    );
  }
}
