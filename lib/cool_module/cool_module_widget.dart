import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'cool_module_wm.dart';

// TODO: cover with documentation
/// Main widget for CoolModule module
class CoolModuleWidget extends ElementaryWidget<CoolModuleWidgetModel> {
  final int notifierValue;
  final int counterValue;

  CoolModuleWidget({
    required this.notifierValue,
    required this.counterValue,
    Key? key,
  }) : super(
          (context) => CoolModuleWidgetModel.factory(
            context,
            notifierValue,
            counterValue,
          ),
          key: key,
        );

  @override
  Widget build(CoolModuleWidgetModel wm) {
    print('build::elementary, ${wm.notifierValue}');
    return Column(
      children: [
        Text(
          "ElementaryWidget",
          style: Theme.of(wm.context).textTheme.bodyMedium,
        ),
        Text(
          "Counter: ${wm.counterValue}",
          style: Theme.of(wm.context).textTheme.headline6,
        ),
        Text(
          "Notifier: ${wm.notifierValue}",
          style: Theme.of(wm.context).textTheme.headline6,
        ),
        SizedBox(height: 16),
        Text(
          "Listenable",
          style: Theme.of(wm.context).textTheme.bodyMedium,
        ),
        ValueListenableBuilder<int>(
            valueListenable: wm.notifier,
            builder: (context, value, _) {
              return Column(
                children: [
                  Text(
                    "Counter: ${wm.counterValue}",
                    style: Theme.of(wm.context).textTheme.headline6,
                  ),
                  Text(
                    "Notifier: $value",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              );
            }),
      ],
    );
  }
}
