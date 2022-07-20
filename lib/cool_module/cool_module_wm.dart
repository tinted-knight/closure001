import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'cool_module_model.dart';
import 'cool_module_widget.dart';

class CoolModuleWidgetModel extends WidgetModel<CoolModuleWidget, CoolModuleModel> {
  CoolModuleWidgetModel(
    this.notifierValue,
    this.counterValue,
    CoolModuleModel model,
  ) : super(model);

  final int notifierValue;
  final int counterValue;

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
  // В Элементари виджет в параметре назван oldWidget - это враньё)))
  // На самом деле в нём как раз актуальные данные данные
  // ignore: avoid_renaming_method_parameters
  void didUpdateWidget(CoolModuleWidget newWidget) {
    super.didUpdateWidget(newWidget);
    print('wm::didUpdate, notifier=$notifierValue, counter=$counterValue');
    print('newWidget, notifier=${newWidget.notifierValue}, counter=${newWidget.counterValue}');
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
