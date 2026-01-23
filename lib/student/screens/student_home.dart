import 'package:flutter/material.dart';
import 'prebooking_screen.dart';

const Color lightGreen = Color(0xFFE9F3E9);
const Color primaryGreen = Color(0xFF228B22);

class StudentHome extends StatelessWidget {
  const StudentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        ),
        title: Image.asset(
          'assets/logo/messmaster.png',
          height: 38,
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(12),
            child: Icon(Icons.menu, color: Colors.black),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle("Today’s Meal Schedule"),

            // All meals now show Book Now button
            _mealCard(context, "Breakfast"),
            _mealCard(context, "Lunch"),
            _mealCard(context, "Snacks"),
            _mealCard(context, "Dinner"),

            const SizedBox(height: 22),
            _sectionTitle("Today’s Menu"),
            _menuTabs(),
            const SizedBox(height: 12),
            _menuCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryGreen,
        unselectedItemColor: primaryGreen.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "BOOKINGS"),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: "FITSYNC"),
          BottomNavigationBarItem(icon: Icon(Icons.feedback), label: "FEEDBACK"),
        ],
      ),
    );
  }

  // ---------------- UI WIDGETS ----------------

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _mealCard(BuildContext context, String meal) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(meal, style: const TextStyle(fontSize: 16)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              // Navigate to PreBookingScreen for this meal
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PreBookingScreen(mealType: meal),
                ),
              );
            },
            child: const Text("Book Now"),
          ),
        ],
      ),
    );
  }

  Widget _menuTabs() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text("Breakfast"),
          Chip(
            label: Text("Lunch", style: TextStyle(color: Colors.white)),
            backgroundColor: primaryGreen,
          ),
          Text("Snacks"),
          Text("Dinner"),
        ],
      ),
    );
  }

  Widget _menuCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Monday Special Lunch",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryGreen,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text("• Rajma"),
                Text("• Raita"),
                Text("• Rice"),
                Text("• Chapati"),
                Text("• Salad"),
              ],
            ),
          ),
          Column(
            children: [
              Image.asset(
                'assets/meals/lunch.jpeg',
                height: 90,
              ),
              const SizedBox(height: 6),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: primaryGreen,
                ),
                onPressed: () {},
                child: const Text("View Full Menu"),
              )
            ],
          )
        ],
      ),
    );
  }
}
