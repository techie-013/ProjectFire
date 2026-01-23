import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const Color primaryGreen = Color(0xFF228B22);
const Color lightGreen = Color(0xFFE9F3E9);

class PreBookingScreen extends StatefulWidget {
  final String mealType;

  const PreBookingScreen({super.key, required this.mealType});

  @override
  State<PreBookingScreen> createState() => _PreBookingScreenState();
}

class _PreBookingScreenState extends State<PreBookingScreen> {
  Map<String, int> quantities = {};
  int totalAmount = 0;

  // Prices for all items
  final Map<String, int> prices = {
    "Paratha": 15,
    "Toast": 10,
    "Milk": 10,
    "Tea": 8,
    "Coffee": 10,
    "Chowmein": 30,
    "Maggi": 20,
    "Burger": 40,
    "Fingers": 40,
    "Pasta": 35,
    "Pav Bhaji": 25,
    "Lunch": 45,   // Fixed meal price
    "Dinner": 45,  // Fixed meal price
  };

  void _addItem(String name, int price) {
    setState(() {
      quantities[name] = (quantities[name] ?? 0) + 1;
      totalAmount += price;
    });
  }

  void _removeItem(String name, int price) {
    if ((quantities[name] ?? 0) > 0) {
      setState(() {
        quantities[name] = quantities[name]! - 1;
        totalAmount -= price;
        if (quantities[name] == 0) quantities.remove(name);
      });
    }
  }

  Future<void> _bookNow() async {
    if (quantities.isEmpty) return;

    final itemsList = quantities.entries.map((e) => {
      "name": e.key,
      "qty": e.value,
      "price": prices[e.key] ?? 0,
    }).toList();

    final bookingData = {
      "studentId": "demo_student_01", // Replace with FirebaseAuth.currentUser!.uid
      "studentName": "Sneha Singh",   // Replace with FirebaseAuth.currentUser!.displayName
      "mealType": widget.mealType,
      "items": itemsList,
      "totalAmount": totalAmount,
      "date": DateTime.now().toIso8601String().split("T")[0],
      "timeSlot": widget.mealType, // Using mealType as slot (Breakfast/Lunch/Dinner)
      "status": "booked",
      "createdAt": Timestamp.now(),
    };

    await FirebaseFirestore.instance.collection("bookings").add(bookingData);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Booking Successful")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.mealType} Booking"),
        backgroundColor: primaryGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _getMealContent(),
      ),
      bottomNavigationBar: totalAmount > 0
          ? Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 6),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total: ₹$totalAmount",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                padding: const EdgeInsets.symmetric(
                    horizontal: 28, vertical: 14),
              ),
              onPressed: _bookNow,
              child: const Text("Book Now"),
            )
          ],
        ),
      )
          : null,
    );
  }

  Widget _getMealContent() {
    switch (widget.mealType) {
      case "Breakfast":
        return _breakfast();
      case "Lunch":
        return _fixedMeal("Lunch", prices["Lunch"]!);
      case "Snacks":
        return _snacks();
      case "Dinner":
        return _fixedMeal("Dinner", prices["Dinner"]!);
      default:
        return const Center(child: Text("Invalid Meal"));
    }
  }

  Widget _breakfast() {
    return ListView(
      children: [
        _counterItem("Paratha", 15, "assets/breakfast/paratha.jpeg"),
        _counterItem("Toast", 10, "assets/breakfast/toast.jpeg"),
        _counterItem("Milk", 10, "assets/breakfast/milk.jpeg"),
        _counterItem("Tea", 8, "assets/breakfast/tea.jpeg"),
        _counterItem("Coffee", 10, "assets/breakfast/coffee.jpeg"),
      ],
    );
  }

  Widget _fixedMeal(String title, int price) {
    return Card(
      color: lightGreen,
      child: ListTile(
        title: Text("$title Meal"),
        subtitle: Text("Fixed Price ₹$price"),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: primaryGreen),
          onPressed: () => _addItem(title, price),
          child: const Text("Add"),
        ),
      ),
    );
  }

  Widget _snacks() {
    return ListView(
      children: [
        _counterItem("Chowmein", 30, "assets/snacks/chowmein.jpeg"),
        _counterItem("Maggi", 20, "assets/snacks/maggi.jpeg"),
        _counterItem("Burger", 40, "assets/snacks/burger.jpeg"),
        _counterItem("Fingers", 40, "assets/snacks/fingers.jpeg"),
        _counterItem("Pasta", 35, "assets/snacks/pasta.jpeg"),
        _counterItem("Pav Bhaji", 25, "assets/snacks/pav_bhaji.jpeg"),
      ],
    );
  }

  Widget _counterItem(String name, int price, String image) {
    final qty = quantities[name] ?? 0;

    return Card(
      color: lightGreen,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Image.asset(image, height: 40),
        title: Text("$name (₹$price)"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => _removeItem(name, price),
            ),
            Text(qty.toString()),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _addItem(name, price),
            ),
          ],
        ),
      ),
    );
  }
}
