import 'package:flutter/material.dart';
import 'login_selection_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF3ED),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo box
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFFDCE5D8),
              ),
              child: Image.asset(
                'assets/logo.png', // your mess logo
                height: 80,
              ),
            ),

            const SizedBox(height: 24),

            // Mess Master button
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF3F5D46),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'MESS MASTER',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Transforming Campus Dining with AI & Sustainability',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginSelectionScreen(),
                  ),
                );
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
