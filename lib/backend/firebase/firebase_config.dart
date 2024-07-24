import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDv-UbA0fcsk0OtNHwYCg5bV5OqESDjtHk",
            authDomain: "vn-mobile-applications.firebaseapp.com",
            projectId: "vn-mobile-applications",
            storageBucket: "vn-mobile-applications.appspot.com",
            messagingSenderId: "680841686623",
            appId: "1:680841686623:web:fd6a51c5c494cb815ab5ea"));
  } else {
    await Firebase.initializeApp();
  }
}
