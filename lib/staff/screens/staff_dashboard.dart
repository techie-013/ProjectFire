import 'package:flutter/material.dart';


class StaffDashboard extends StatelessWidget {
  const StaffDashboard({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mess Staff Dashboard')),
      body: ListView(children: const [
        ListTile(title: Text('Meal Verification')),
        ListTile(title: Text('Waste to Worth')),
        ListTile(title: Text('Feedback Overview')),
      ]),
    );
  }
}