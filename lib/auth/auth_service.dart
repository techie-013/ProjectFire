import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  Future<User?> register({
    required String email,
    required String password,
    required String role,
    required Map<String, dynamic> extraData,
  }) async {
    final cred = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _db.collection('users').doc(cred.user!.uid).set({
      'role': role,
      ...extraData,
      'createdAt': Timestamp.now(),
    });

    return cred.user;
  }

  Future<User?> login({
    required String email,
    required String password,
  }) async {
    final cred = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return cred.user;
  }

  Future<String?> getUserRole(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    return doc.data()?['role'];
  }
}
