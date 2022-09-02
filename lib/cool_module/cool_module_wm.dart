import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'cool_module_model.dart';
import 'cool_module_widget.dart';

class CoolModuleWidgetModel extends WidgetModel<CoolModuleWidget, CoolModuleModel> {
  CoolModuleWidgetModel(
    this.notifierValue,
    this.counterValue,
    CoolModuleModel model,
  )   : notifier = ValueNotifier(notifierValue),
        super(model);

  final int notifierValue;
  final int counterValue;

  final ValueNotifier<int> notifier;

  factory CoolModuleWidgetModel.factory(
    BuildContext context,
    int notifierValue,
    int counterValue,
  ) {
    return _coolModuleWidgetModelFactory(
      context,
      notifierValue,
      counterValue,
    );
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    print('wm::init');
  }

  @override
  void didUpdateWidget(CoolModuleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    notifier.value = widget.notifierValue;
    print("===============================");
    print('wm::didUpdate, '
        'notifier=$notifierValue, '
        'counter=$counterValue');
    print('oldWidget, '
        'notifier=${oldWidget.notifierValue}, '
        'counter=${oldWidget.counterValue}');
    print('widget, '
        'notifier=${widget.notifierValue}, '
        'counter=${widget.counterValue}');
    // ??? Как здесь зафорсить отрисовку виджета CoolModelWidget
    // (context as Element).markNeedsBuild();
  }

  @override
  void didChangeDependencies() {
    print('wm::didChangeDeps');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

CoolModuleWidgetModel _coolModuleWidgetModelFactory(
  BuildContext context,
  int notifierValue,
  int counterValue,
) {
  return CoolModuleWidgetModel(
    notifierValue,
    counterValue,
    CoolModuleModel(),
  );
}
