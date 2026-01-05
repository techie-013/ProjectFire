import 'package:flutter/material.dart';
import '../models/daily_bill.dart';

class BillingScreen extends StatelessWidget {
  const BillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for now (later comes Firebase)
    final bills = [
      DailyBill(
        date: DateTime.now(),
        breakfastTaken: true,
        lunchTaken: true,
        dinnerTaken: false,
        snacksTaken: true,
        totalAmount: 150,
      ),
      DailyBill(
        date: DateTime.now().subtract(const Duration(days: 1)),
        breakfastTaken: true,
        lunchTaken: true,
        dinnerTaken: true,
        snacksTaken: false,
        totalAmount: 180,
      ),
    ];


    return Scaffold(
      appBar: AppBar(
        title: const Text('My Mess Bill'),
      ),
      body: ListView.builder(
        itemCount: bills.length,
        itemBuilder: (context, index) {
          final bill = bills[index];

          return Card(
            margin: const EdgeInsets.all(12),
            child: ListTile(
              title: Text(
                '${bill.date.day}/${bill.date.month}/${bill.date.year}',
              ),
              subtitle: Text(
                'Breakfast: ${bill.breakfastTaken ? "✔" : "✖"}  '
                    'Lunch: ${bill.lunchTaken ? "✔" : "✖"}  '
                    'Dinner: ${bill.dinnerTaken ? "✔" : "✖"}  '
                    'Snacks: ${bill.snacksTaken ? "✔" : "✖"}',
              ),

              trailing: Text(
                '₹${bill.totalAmount}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
