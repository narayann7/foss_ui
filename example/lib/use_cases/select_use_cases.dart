import 'package:flutter/widgets.dart';
import 'package:foss_ui/foss_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

const List<FossSelectItem<String>> _fruits = [
  FossSelectItem(value: 'apple', label: 'Apple'),
  FossSelectItem(value: 'banana', label: 'Banana'),
  FossSelectItem(value: 'cherry', label: 'Cherry'),
  FossSelectItem(value: 'date', label: 'Date'),
  FossSelectItem(value: 'elderberry', label: 'Elderberry', enabled: false),
];

@widgetbook.UseCase(name: 'Playground', type: FossSelect)
Widget playgroundSelect(BuildContext context) {
  final size = context.knobs.object.dropdown(
    label: 'Size',
    options: FossSelectSize.values,
    initialOption: FossSelectSize.md,
    labelBuilder: (v) => v.name,
  );
  final label = context.knobs.string(label: 'Label', initialValue: 'Fruit');
  final placeholder = context.knobs.string(
    label: 'Placeholder',
    initialValue: 'Choose a fruit',
  );
  final error = context.knobs.string(label: 'Error');
  final multi = context.knobs.boolean(label: 'Multi-select');
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);

  return Center(
    child: SizedBox(
      width: 280,
      child: _SelectDemo(
        size: size,
        label: label.isEmpty ? null : label,
        placeholder: placeholder.isEmpty ? null : placeholder,
        errorText: error.isEmpty ? null : error,
        multi: multi,
        enabled: enabled,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'States', type: FossSelect)
Widget statesSelect(BuildContext context) => const Center(
  child: SizedBox(
    width: 280,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 24,
      children: [
        FossSelect<String>(
          label: 'Default',
          placeholder: 'Choose a fruit',
          items: _fruits,
        ),
        FossSelect<String>(
          label: 'Selected',
          value: 'banana',
          items: _fruits,
        ),
        FossSelect<String>(
          label: 'Error',
          placeholder: 'Choose a fruit',
          errorText: 'Pick one',
          items: _fruits,
        ),
        FossSelect<String>(
          label: 'Disabled',
          placeholder: 'Choose a fruit',
          enabled: false,
          items: _fruits,
        ),
        FossMultiSelect<String>(
          label: 'Multi-select',
          values: {'apple', 'cherry'},
          items: _fruits,
        ),
      ],
    ),
  ),
);

class _SelectDemo extends StatefulWidget {
  const _SelectDemo({
    required this.size,
    required this.multi,
    required this.enabled,
    this.label,
    this.placeholder,
    this.errorText,
  });

  final FossSelectSize size;
  final bool multi;
  final bool enabled;
  final String? label;
  final String? placeholder;
  final String? errorText;

  @override
  State<_SelectDemo> createState() => _SelectDemoState();
}

class _SelectDemoState extends State<_SelectDemo> {
  String? _value;
  Set<String> _values = {};

  @override
  Widget build(BuildContext context) {
    if (widget.multi) {
      return FossMultiSelect<String>(
        values: _values,
        placeholder: widget.placeholder,
        label: widget.label,
        errorText: widget.errorText,
        size: widget.size,
        enabled: widget.enabled,
        items: _fruits,
        onChanged: (next) => setState(() => _values = next),
      );
    }
    return FossSelect<String>(
      value: _value,
      placeholder: widget.placeholder,
      label: widget.label,
      errorText: widget.errorText,
      size: widget.size,
      enabled: widget.enabled,
      items: _fruits,
      onChanged: (next) => setState(() => _value = next),
    );
  }
}
