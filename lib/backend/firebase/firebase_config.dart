import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBW1Ydv-4uLLFm12uH3X-DmBVxoX7C2LNo",
            authDomain: "lionbc-barberia.firebaseapp.com",
            projectId: "lionbc-barberia",
            storageBucket: "lionbc-barberia.firebasestorage.app",
            messagingSenderId: "805388382483",
            appId: "1:805388382483:web:5c0e68a66de437c0b7aae6",
            measurementId: "G-96DS998PW7"));
  } else {
    await Firebase.initializeApp();
  }
}
