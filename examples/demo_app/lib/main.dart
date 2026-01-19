import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';
import 'package:utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Package Demo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          InfoCard(
            title: 'Widgets Package',
            subtitle: 'Custom UI components including buttons, cards, and inputs',
          ),
          InfoCard(
            title: 'State Management',
            subtitle: 'Simple state management solution with Store and StoreBuilder',
          ),
          InfoCard(
            title: 'Network',
            subtitle: 'HTTP client and API utilities for making requests',
          ),
          InfoCard(
            title: 'Shared',
            subtitle: 'Shared models like User and Post',
          ),
          InfoCard(
            title: 'Utils',
            subtitle: 'Utility functions for dates, strings, and validators',
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Test Button',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Current time: ${DateFormatter.formatDateTime(DateTime.now())}',
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          TextFieldInput(
            labelText: 'Email',
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            validator: Validators.email,
          ),
        ],
      ),
    );
  }
}
