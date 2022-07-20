import 'dart:async';

import 'package:closure001/cool_module/cool_module_widget.dart';
import 'package:flutter/material.dart';

final notifier = ValueNotifier<int>(0);

void main() {
  Timer.periodic(const Duration(seconds: 3), (timer) {
    notifier.value += 1;
    print('notifier:=${notifier.value}');
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counterValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counterValue',
              style: Theme.of(context).textTheme.headline4,
            ),
            ValueListenableBuilder<int>(
              valueListenable: notifier,
              builder: (context, value, __) {
                print('vlBuilder: value=$value, counter=$_counterValue');
                return CoolModuleWidget(
                  notifierValue: value,
                  counterValue: _counterValue,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counterValue++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
