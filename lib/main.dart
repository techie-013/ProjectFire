import 'package:flutter/material.dart';
import 'screens/role_selection.dart';

void main() {
  runApp(const MessMasterApp());
}

class MessMasterApp extends StatelessWidget {
  const MessMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RoleSelectionScreen(),
    );
  }
}
