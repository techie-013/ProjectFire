import 'package:flutter/material.dart';
import '../utils/roles.dart';
import 'auth_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mess Master'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Continue as',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            _roleButton(context, 'Student', UserRole.student),
            _roleButton(context, 'Mess Admin', UserRole.admin),
            _roleButton(context, 'Super Admin', UserRole.superAdmin),
          ],
        ),
      ),
    );
  }

  Widget _roleButton(
      BuildContext context, String text, UserRole role) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 55),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AuthScreen(role: role),
            ),
          );
        },
        child: Text(text, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
