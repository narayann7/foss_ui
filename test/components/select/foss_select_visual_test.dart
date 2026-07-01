import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foss_ui/foss_ui.dart';

import 'host.dart';

const List<FossSelectItem<String>> _items = [
  FossSelectItem(value: 'a', label: 'Apple'),
  FossSelectItem(value: 'b', label: 'Banana'),
];

Iterable<ShapeDecoration> _shapeDecorations(WidgetTester tester) => tester
    .widgetList<DecoratedBox>(find.byType(DecoratedBox))
    .map((d) => d.decoration)
    .whereType<ShapeDecoration>();

void main() {
  group('FossSelect visuals', () {
    testWidgets('the dark trigger fill lifts off the surface', (tester) async {
      await tester.pumpWidget(
        host(
          theme: FossThemeData.dark,
          const FossSelect<String>(placeholder: 'Pick', items: _items),
        ),
      );

      final surface = FossThemeData.dark.colors.background;
      expect(
        _shapeDecorations(
          tester,
        ).any((d) => d.color != null && d.color != surface),
        isTrue,
        reason: 'trigger fill is lifted, not the bare dark surface',
      );
    });

    testWidgets('errorText recolors the trigger border to destructive', (
      tester,
    ) async {
      await tester.pumpWidget(
        host(
          const FossSelect<String>(
            placeholder: 'Pick',
            errorText: 'Required',
            items: _items,
          ),
        ),
      );

      final expected = FossThemeData.light.colors.destructive.withValues(
        alpha: 0.36,
      );
      final borders = _shapeDecorations(tester)
          .map((d) => d.shape)
          .whereType<RoundedSuperellipseBorder>()
          .map((b) => b.side.color);
      expect(borders, contains(expected));
    });
  });
}
