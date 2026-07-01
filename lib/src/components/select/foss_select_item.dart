part of 'foss_select.dart';

/// One option in a [FossSelect] or [FossMultiSelect].
///
/// Carries the [value] it contributes to the selection, the [label] rendered on
/// its row and, for a single pick, in the trigger, an optional leading [icon],
/// and whether it [enabled] accepts a pick. The [value] is compared by `==`, so
/// value types or identity both work.
///
/// ```dart
/// const FossSelectItem(value: 'monthly', label: 'Monthly');
/// ```
@immutable
class FossSelectItem<T> {
  /// Creates a select option. [value] and [label] are required.
  const FossSelectItem({
    required this.value,
    required this.label,
    this.icon,
    this.enabled = true,
  });

  /// The value this option contributes to the selection, compared by `==`.
  final T value;

  /// The text shown on the row and, for a single pick, in the trigger.
  final String label;

  /// Optional leading glyph. Any widget works; the package takes no icon
  /// dependency.
  final Widget? icon;

  /// Whether this option accepts a pick. A disabled option is dimmed and
  /// non-interactive, still exposed to assistive technology.
  final bool enabled;
}

/// The height and type scale of a [FossSelect] or [FossMultiSelect] trigger.
enum FossSelectSize {
  /// Compact: a 32 logical-pixel trigger with the small type scale.
  sm,

  /// Default: a 36 logical-pixel trigger with the base type scale.
  md,

  /// Large: a 40 logical-pixel trigger with the base type scale.
  lg,
}
