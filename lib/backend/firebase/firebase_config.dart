import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCE0fDZpGnL2nE3ajQ3B5ayFjKCGZXsjIk",
            authDomain: "prioritize-v5lehr.firebaseapp.com",
            projectId: "prioritize-v5lehr",
            storageBucket: "prioritize-v5lehr.firebasestorage.app",
            messagingSenderId: "637646518118",
            appId: "1:637646518118:web:2cd4133f13e976d72d3aa7",
            measurementId: "G-N7YTHBVEB7"));
  } else {
    await Firebase.initializeApp();
  }
}
