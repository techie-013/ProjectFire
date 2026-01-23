import 'package:flutter/material.dart';


class PollingScreen extends StatelessWidget {
  const PollingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Polling')),
      body: Center(child: Text('Vote on Menu & Decisions – Coming Soon')),
    );
  }
}