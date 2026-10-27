import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform;

/// Replace with credentials from your Firebase Console
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        return android;
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDP2DHt6JadHkd810n4GxFOJdIZVn35ylM',
    appId: '1:44934998096:android:f4ebf23f49ffb1e2384955',
    messagingSenderId: '44934998096',
    projectId: 'chat-app-afd93',
    storageBucket: 'chat-app-afd93.firebasestorage.app',
  );
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVLvYu-erqvqe6tn2tn5iV9Qzl_fFuHOw',
    appId: '1:44934998096:ios:d7c5f86e23cf774c384955',
    messagingSenderId: '44934998096',
    projectId: 'chat-app-afd93',
    storageBucket: 'chat-app-afd93.firebasestorage.app',
    androidClientId: '44934998096-l2f4nrj3opqs00ikbqh70r71ap6buk43.apps.googleusercontent.com',
    iosClientId: '44934998096-i6qbmoqs6i5p3fp3k622o1go7pmaa8ge.apps.googleusercontent.com',
    iosBundleId: 'com.example.nutrivision',
  );
}
