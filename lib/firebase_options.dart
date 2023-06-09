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
    apiKey: 'AIzaSyDg_qy4clht3WPCbdV5J1r_ECYLX9IsTmw',
    appId: '1:1046103251656:web:c037dbe3034ae0ee46e3fd',
    messagingSenderId: '1046103251656',
    projectId: 'chat-app-7464c',
    authDomain: 'chat-app-7464c.firebaseapp.com',
    storageBucket: 'chat-app-7464c.appspot.com',
    measurementId: 'G-NJDRZ9HM76',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCem0Xx3Zu_9XdZywZADPB_Gyo57sPuoXU',
    appId: '1:1046103251656:android:8ffd6d006bcf140e46e3fd',
    messagingSenderId: '1046103251656',
    projectId: 'chat-app-7464c',
    storageBucket: 'chat-app-7464c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACQbJXKeFNzMJfKm1lbTlBJhHzGiqheY8',
    appId: '1:1046103251656:ios:b1aebbf3397b46e746e3fd',
    messagingSenderId: '1046103251656',
    projectId: 'chat-app-7464c',
    storageBucket: 'chat-app-7464c.appspot.com',
    iosClientId: '1046103251656-evrhnrt0tjo1gtaqtqre3m4irg258jdk.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatAppTharwat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACQbJXKeFNzMJfKm1lbTlBJhHzGiqheY8',
    appId: '1:1046103251656:ios:b1aebbf3397b46e746e3fd',
    messagingSenderId: '1046103251656',
    projectId: 'chat-app-7464c',
    storageBucket: 'chat-app-7464c.appspot.com',
    iosClientId: '1046103251656-evrhnrt0tjo1gtaqtqre3m4irg258jdk.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatAppTharwat',
  );
}
