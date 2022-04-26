import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'cool_module_model.dart';
import 'cool_module_widget.dart';

abstract class ICoolModuleWidgetModel extends IWidgetModel {
  ValueNotifier<int> get notifier;
}

CoolModuleWidgetModel defaultCoolModuleWidgetModelFactory(
    BuildContext context) {
  return CoolModuleWidgetModel(CoolModuleModel());
}

// TODO: cover with documentation
/// Default widget model for CoolModuleWidget
class CoolModuleWidgetModel
    extends WidgetModel<CoolModuleWidget, CoolModuleModel>
    implements ICoolModuleWidgetModel {
  @override
  final notifier = ValueNotifier<int>(0);

  Timer? _timer;

  CoolModuleWidgetModel(CoolModuleModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    // Simulating update of some data to force ValueListenableBuilder::builder
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      notifier.value += 1;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
