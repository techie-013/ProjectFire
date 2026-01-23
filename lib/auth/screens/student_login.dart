import 'package:flutter/material.dart';
import '../auth_service.dart';
import '../../student/screens/student_home.dart';


class StudentLogin extends StatelessWidget {
  const StudentLogin({super.key});


  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final pass = TextEditingController();


    return Scaffold(
      appBar: AppBar(title: const Text('Student Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextField(controller: email, decoration: const InputDecoration(labelText: 'Email')),
          TextField(controller: pass, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              try {
                final user = await AuthService()
                    .login(email.text.trim(), pass.text.trim());

                if (user != null && context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const StudentHome()),
                  );
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login failed: ${e.toString()}')),
                );
              }
            },

            child: const Text('Login'),
          ),
        ]),
      ),
    );
  }
}