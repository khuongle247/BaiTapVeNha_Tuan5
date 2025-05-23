// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyBZVymncxgVLDWEP3YKNf7sj8KpPu-Z4eM',
    appId: '1:417386132068:web:585db351222c75bfce2571',
    messagingSenderId: '417386132068',
    projectId: 'baitapvenha-a72e1',
    authDomain: 'baitapvenha-a72e1.firebaseapp.com',
    storageBucket: 'baitapvenha-a72e1.firebasestorage.app',
    measurementId: 'G-X8BLRLQKKT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDw5gc2Bvv6y2EBHZLUuXj8j73MRYS1Vys',
    appId: '1:417386132068:android:adfa326ef14cdf20ce2571',
    messagingSenderId: '417386132068',
    projectId: 'baitapvenha-a72e1',
    storageBucket: 'baitapvenha-a72e1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAb1xuFuORWBF_unXf3mhLvCqsAp4KDMU8',
    appId: '1:417386132068:ios:0382b6d8c9ed0174ce2571',
    messagingSenderId: '417386132068',
    projectId: 'baitapvenha-a72e1',
    storageBucket: 'baitapvenha-a72e1.firebasestorage.app',
    iosBundleId: 'com.example.baitapvenha05',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAb1xuFuORWBF_unXf3mhLvCqsAp4KDMU8',
    appId: '1:417386132068:ios:0382b6d8c9ed0174ce2571',
    messagingSenderId: '417386132068',
    projectId: 'baitapvenha-a72e1',
    storageBucket: 'baitapvenha-a72e1.firebasestorage.app',
    iosBundleId: 'com.example.baitapvenha05',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBZVymncxgVLDWEP3YKNf7sj8KpPu-Z4eM',
    appId: '1:417386132068:web:c06f7d91afbcd1fbce2571',
    messagingSenderId: '417386132068',
    projectId: 'baitapvenha-a72e1',
    authDomain: 'baitapvenha-a72e1.firebaseapp.com',
    storageBucket: 'baitapvenha-a72e1.firebasestorage.app',
    measurementId: 'G-6W63Q33RND',
  );
}
