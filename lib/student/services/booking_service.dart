import 'package:cloud_firestore/cloud_firestore.dart';

class BookingService {
  final _db = FirebaseFirestore.instance;

  Future<void> createBooking({
    required String studentId,
    required String studentName,
    required String mealType,
    required List<Map<String, dynamic>> items,
    required int totalAmount,
  }) async {
    await _db.collection('bookings').add({
      "studentId": studentId,
      "studentName": studentName,
      "mealType": mealType,
      "items": items,
      "totalAmount": totalAmount,
      "date": DateTime.now().toIso8601String().split("T")[0],
      "status": "booked",
      "createdAt": Timestamp.now(),
    });
  }
}
