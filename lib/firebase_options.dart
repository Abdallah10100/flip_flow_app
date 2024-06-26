// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBz09aVfd4vNQm6yA2dHSlmnFKnxOzBA68',
    appId: '1:698324039374:web:6f9ef5d7f6b297bc0a829f',
    messagingSenderId: '698324039374',
    projectId: 'flipflow-app-ae87b',
    authDomain: 'flipflow-app-ae87b.firebaseapp.com',
    storageBucket: 'flipflow-app-ae87b.appspot.com',
    measurementId: 'G-6NGK2J000S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCizjQQIAKKahSyMxfQpgCZI9uKtw6l3t8',
    appId: '1:698324039374:android:88b44e9980670a7f0a829f',
    messagingSenderId: '698324039374',
    projectId: 'flipflow-app-ae87b',
    storageBucket: 'flipflow-app-ae87b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBx0_G6B3S_rdBQt9dVJAwkBPX1mxnXrZg',
    appId: '1:698324039374:ios:d359adb917fa7d870a829f',
    messagingSenderId: '698324039374',
    projectId: 'flipflow-app-ae87b',
    storageBucket: 'flipflow-app-ae87b.appspot.com',
    iosBundleId: 'com.example.flipflowApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBx0_G6B3S_rdBQt9dVJAwkBPX1mxnXrZg',
    appId: '1:698324039374:ios:d359adb917fa7d870a829f',
    messagingSenderId: '698324039374',
    projectId: 'flipflow-app-ae87b',
    storageBucket: 'flipflow-app-ae87b.appspot.com',
    iosBundleId: 'com.example.flipflowApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBz09aVfd4vNQm6yA2dHSlmnFKnxOzBA68',
    appId: '1:698324039374:web:e31786716efe83ec0a829f',
    messagingSenderId: '698324039374',
    projectId: 'flipflow-app-ae87b',
    authDomain: 'flipflow-app-ae87b.firebaseapp.com',
    storageBucket: 'flipflow-app-ae87b.appspot.com',
    measurementId: 'G-21RLNTL2PD',
  );

}