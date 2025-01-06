import 'package:flutter/material.dart';
import 'package:whitelabels_example/configs/apps/base_config.dart';

class MyApp extends StatelessWidget {
  final BaseConfig currentConfig;

  const MyApp({
    super.key,
    required this.currentConfig,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: currentConfig.title,
      theme: currentConfig.theme,
      home: MyHomePage(
        title: currentConfig.title,
        baseUrlApi: currentConfig.baseUrlApi,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.baseUrlApi});

  final String title;
  final String baseUrlApi;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'baseUrlApi: ${widget.baseUrlApi}',
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
