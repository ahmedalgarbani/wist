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
    apiKey: 'AIzaSyD9nKT58wN4LHtUDnCBQplSuqzU-ttUpZA',
    appId: '1:554086500243:web:c9fb074a806b5b72e40a66',
    messagingSenderId: '554086500243',
    projectId: 'ambulance-a0046',
    authDomain: 'ambulance-a0046.firebaseapp.com',
    databaseURL: 'https://ambulance-a0046-default-rtdb.firebaseio.com',
    storageBucket: 'ambulance-a0046.appspot.com',
    measurementId: 'G-GVZSN77F0E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3wHcMIc3J2JSIosELofF6NFR9_6I3nfQ',
    appId: '1:554086500243:android:fc7f0a6c61e8823fe40a66',
    messagingSenderId: '554086500243',
    projectId: 'ambulance-a0046',
    databaseURL: 'https://ambulance-a0046-default-rtdb.firebaseio.com',
    storageBucket: 'ambulance-a0046.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOC5M3PHpWpcKzHzZ6k1r4AaMsLyiA6WI',
    appId: '1:554086500243:ios:b5dc3d1ab694b7f1e40a66',
    messagingSenderId: '554086500243',
    projectId: 'ambulance-a0046',
    databaseURL: 'https://ambulance-a0046-default-rtdb.firebaseio.com',
    storageBucket: 'ambulance-a0046.appspot.com',
    iosBundleId: 'com.example.wist',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOC5M3PHpWpcKzHzZ6k1r4AaMsLyiA6WI',
    appId: '1:554086500243:ios:b5dc3d1ab694b7f1e40a66',
    messagingSenderId: '554086500243',
    projectId: 'ambulance-a0046',
    databaseURL: 'https://ambulance-a0046-default-rtdb.firebaseio.com',
    storageBucket: 'ambulance-a0046.appspot.com',
    iosBundleId: 'com.example.wist',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD9nKT58wN4LHtUDnCBQplSuqzU-ttUpZA',
    appId: '1:554086500243:web:053efd63739836c7e40a66',
    messagingSenderId: '554086500243',
    projectId: 'ambulance-a0046',
    authDomain: 'ambulance-a0046.firebaseapp.com',
    databaseURL: 'https://ambulance-a0046-default-rtdb.firebaseio.com',
    storageBucket: 'ambulance-a0046.appspot.com',
    measurementId: 'G-VP9XNE2CV8',
  );
}
