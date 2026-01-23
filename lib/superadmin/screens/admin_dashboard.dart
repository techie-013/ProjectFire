import 'package:flutter/material.dart';


class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Super Admin Dashboard')),
      body: ListView(children: const [
        ListTile(title: Text('User Management')),
        ListTile(title: Text('Meal Pricing')),
        ListTile(title: Text('NGO Mapping')),
        ListTile(title: Text('Analytics')),
      ]),
    );
  }
}