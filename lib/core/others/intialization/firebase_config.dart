import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static Future init(FirebaseOptions options) async {
    await Firebase.initializeApp(options: options);
  }
}
