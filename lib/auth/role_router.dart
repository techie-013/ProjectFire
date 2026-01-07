import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../dashboards/student_dashboard.dart';
import '../dashboards/admin_dashboard.dart';
import '../dashboards/superadmin_dashboard.dart';
import 'auth_service.dart';

class RoleRouter extends StatelessWidget {
  const RoleRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return const SizedBox();

    return FutureBuilder<String?>(
      future: AuthService().getUserRole(user.uid),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        switch (snapshot.data) {
          case 'student':
            return const StudentDashboard();
          case 'admin':
            return const AdminDashboard();
          case 'superadmin':
            return const SuperAdminDashboard();
          default:
            return const Scaffold(body: Center(child: Text("Invalid Role")));
        }
      },
    );
  }
}
