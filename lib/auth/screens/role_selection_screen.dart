import 'package:flutter/material.dart';
import 'student_login.dart';
import 'staff_login.dart';
import 'admin_login.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  Widget roleButton({
    required String label,
    required String asset,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        Image.asset(
          asset,
          height: 60,
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: onTap,
          child: Text(label),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔰 APP LOGO
            Image.asset(
              'assets/logo/messmaster.png',
              height: 120,
            ),

            const SizedBox(height: 30),

            roleButton(
              label: 'Student',
              asset: 'assets/logo/student_logo.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StudentLogin()),
                );
              },
            ),

            roleButton(
              label: 'Mess Staff',
              asset: 'assets/logo/staff_logo.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StaffLogin()),
                );
              },
            ),

            roleButton(
              label: 'Super Admin',
              asset: 'assets/logo/admin.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AdminLogin()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
