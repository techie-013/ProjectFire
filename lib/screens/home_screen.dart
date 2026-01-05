import 'package:flutter/material.dart';
import 'billing_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mess Master'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const BillingScreen(),
              ),
            );
          },
          child: const Text('Open Billing'),
        ),
      ),
    );
  }
}
