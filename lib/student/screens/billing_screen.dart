import 'package:flutter/material.dart';


class BillingScreen extends StatelessWidget {
  const BillingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text('Billing Transparency')),
      body: Center(child: Text('Meal‑wise Cost Breakdown – Coming Soon')),
    );
  }
}