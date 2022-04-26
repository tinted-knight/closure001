import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'cool_module_wm.dart';

// TODO: cover with documentation
/// Main widget for CoolModule module
class CoolModuleWidget extends ElementaryWidget<ICoolModuleWidgetModel> {
  final Widget Function(BuildContext context, int value) builder;
  const CoolModuleWidget({
    required this.builder,
    Key? key,
    WidgetModelFactory wmFactory = defaultCoolModuleWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICoolModuleWidgetModel wm) {
    return Column(
      children: [
        ValueListenableBuilder<int>(
          valueListenable: wm.notifier,
          builder: (context, value, _) {
           return builder(context, value);
          },
        ),
      ],
    );
  }
}
