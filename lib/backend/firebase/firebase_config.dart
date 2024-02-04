import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDBFQOaaATjZ1VRs_AbFSr1svLWiqNyzZE",
            authDomain: "spaceexplorer2-cc007.firebaseapp.com",
            projectId: "spaceexplorer2-cc007",
            storageBucket: "spaceexplorer2-cc007.appspot.com",
            messagingSenderId: "30743703492",
            appId: "1:30743703492:web:3680818361974f2f5bbe91",
            measurementId: "G-21LB13YGHB"));
  } else {
    await Firebase.initializeApp();
  }
}
