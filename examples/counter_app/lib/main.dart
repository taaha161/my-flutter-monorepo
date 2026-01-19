import 'package:flutter/material.dart';
import 'package:state_management/state_management.dart';
import 'package:widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late final Store<int> counterStore;

  @override
  void initState() {
    super.initState();
    counterStore = Store(0);
  }

  @override
  void dispose() {
    counterStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 20),
            StoreBuilder<int>(
              store: counterStore,
              builder: (context, count) {
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'Decrement',
                  onPressed: () => counterStore.update(counterStore.state - 1),
                ),
                const SizedBox(width: 20),
                CustomButton(
                  text: 'Increment',
                  onPressed: () => counterStore.update(counterStore.state + 1),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterStore.update(0),
        tooltip: 'Reset',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
