import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'cool_module_model.dart';
import 'cool_module_widget.dart';

CoolModuleWidgetModel defaultCoolModuleWidgetModelFactory(
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

class CoolModuleWidgetModel extends WidgetModel<CoolModuleWidget, CoolModuleModel> {
  CoolModuleWidgetModel(
    this.notifierValue,
    this.counterValue,
    CoolModuleModel model,
  ) : super(model);

  final int notifierValue;
  final int counterValue;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    print('wm::init');
  }

  @override
  void didUpdateWidget(covariant CoolModuleWidget oldWidget) {
    print('wm::didUpdateWidget, notifier=$notifierValue, counter=$counterValue');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print('wm::didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
