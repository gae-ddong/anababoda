import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCk4CMmzauhgM6FbAFdJFYoo24h4V_if1I",
            authDomain: "test-7r3x98.firebaseapp.com",
            projectId: "test-7r3x98",
            storageBucket: "test-7r3x98.appspot.com",
            messagingSenderId: "1068607533370",
            appId: "1:1068607533370:web:351a491154f43fb799a003"));
  } else {
    await Firebase.initializeApp();
  }
}
