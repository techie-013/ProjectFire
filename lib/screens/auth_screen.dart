import 'package:flutter/material.dart';
import '../utils/roles.dart';
import 'student_dashboard.dart';
import 'admin_dashboard.dart';
import 'superadmin_dashboard.dart';

class AuthScreen extends StatelessWidget {
  final UserRole role;

  const AuthScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _navigateToDashboard(context);
          },
          child: const Text('Login (Dummy Auth)'),
        ),
      ),
    );
  }

  void _navigateToDashboard(BuildContext context) {
    Widget dashboard;

    switch (role) {
      case UserRole.admin:
        dashboard = const AdminDashboard();
        break;
      case UserRole.superAdmin:
        dashboard = const SuperAdminDashboard();
        break;
      case UserRole.student:
      default:
        dashboard = const StudentDashboard();
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => dashboard),
          (route) => false,
    );
  }
}
