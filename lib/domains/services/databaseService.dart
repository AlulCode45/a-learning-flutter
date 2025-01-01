import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final DatabaseReference referenceDb = FirebaseDatabase.instance.ref();

  // Menulis data ke Realtime Database
  Future<void> writeData(String path, Map<String, dynamic> data) async {
    try {
      await referenceDb.child(path).set(data);
      print("Data successfully written!");
    } catch (e) {
      print("Error writing data: $e");
    }
  }

  // Membaca data dari Realtime Database
  Future<DataSnapshot> readData(String path) async {
    return await referenceDb.child(path).get();
  }

  // Membaca data pengguna berdasarkan userUid
  Future<DataSnapshot> getUserData(String userUid) async {
    return await referenceDb.child('users').orderByChild('userUid').equalTo(userUid).get();
  }
}
