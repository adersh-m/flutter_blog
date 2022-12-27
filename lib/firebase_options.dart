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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyADIL4cFMLYTB8GwMBrpEFsW-cubcq_nTM',
    appId: '1:29576239020:web:e1dad3fd6962bd2caf8c09',
    messagingSenderId: '29576239020',
    projectId: 'simple-blog-app-131bb',
    authDomain: 'simple-blog-app-131bb.firebaseapp.com',
    storageBucket: 'simple-blog-app-131bb.appspot.com',
    measurementId: 'G-0TCKET6F2P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAe09T8GFocagZQG0TY9LacmK0TOC0P7Lk',
    appId: '1:29576239020:android:99cb80c82dd8bf07af8c09',
    messagingSenderId: '29576239020',
    projectId: 'simple-blog-app-131bb',
    storageBucket: 'simple-blog-app-131bb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5X1_Cs_tmR70TG8M3bzm41UBJq7QX_ZE',
    appId: '1:29576239020:ios:ff1e0e41f916fa0daf8c09',
    messagingSenderId: '29576239020',
    projectId: 'simple-blog-app-131bb',
    storageBucket: 'simple-blog-app-131bb.appspot.com',
    iosClientId: '29576239020-e0uh9eg2ffko1qek343g305v8vehbgb1.apps.googleusercontent.com',
    iosBundleId: 'com.flutterblog.demo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5X1_Cs_tmR70TG8M3bzm41UBJq7QX_ZE',
    appId: '1:29576239020:ios:a3e4f8ae966efb78af8c09',
    messagingSenderId: '29576239020',
    projectId: 'simple-blog-app-131bb',
    storageBucket: 'simple-blog-app-131bb.appspot.com',
    iosClientId: '29576239020-i6ntsg5bn4cdbcb8npka0rlc9upc9269.apps.googleusercontent.com',
    iosBundleId: 'com.flutter-blog.demo.flutterBlog',
  );
}
