class RoleSelectScreen extends StatelessWidget {
  const RoleSelectScreen({super.key});

  void go(BuildContext context, String role) {
    if (role == "student") {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const StudentLogin()));
    } else if (role == "admin") {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const AdminLogin()));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const SuperAdminLogin()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => go(context, "student"), child: const Text("Student")),
            ElevatedButton(onPressed: () => go(context, "admin"), child: const Text("Admin")),
            ElevatedButton(onPressed: () => go(context, "super"), child: const Text("Super Admin")),
          ],
        ),
      ),
    );
  }
}
