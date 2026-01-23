import 'package:flutter/material.dart';


class FeedbackOverviewScreen extends StatelessWidget {
  const FeedbackOverviewScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedback Overview')),
      body: Center(child: Text('Student Feedback Analytics – Coming Soon')),
    );
  }
}