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
    apiKey: 'AIzaSyB-wDlBSu40qscbdTyu0PLcvzhCTQ1-Hpw',
    appId: '1:1050632818991:web:dd552605a1002f45d451da',
    messagingSenderId: '1050632818991',
    projectId: 'pmck-1d886',
    authDomain: 'pmck-1d886.firebaseapp.com',
    storageBucket: 'pmck-1d886.appspot.com',
    measurementId: 'G-QR017KHJLQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAn7qm5rxtD57DsYi0qsYXTr_xA85D45Mk',
    appId: '1:1050632818991:android:90122e0b0b75fcb3d451da',
    messagingSenderId: '1050632818991',
    projectId: 'pmck-1d886',
    storageBucket: 'pmck-1d886.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsBTWZfzYQse2IE0wWGMYByCoFb0EapDI',
    appId: '1:1050632818991:ios:3e54d3f4a8be67bfd451da',
    messagingSenderId: '1050632818991',
    projectId: 'pmck-1d886',
    storageBucket: 'pmck-1d886.appspot.com',
    iosClientId: '1050632818991-6iclnv0ohnrms2ja1ktk2775cf5jd57u.apps.googleusercontent.com',
    iosBundleId: 'com.myapp.pmck',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBsBTWZfzYQse2IE0wWGMYByCoFb0EapDI',
    appId: '1:1050632818991:ios:3e54d3f4a8be67bfd451da',
    messagingSenderId: '1050632818991',
    projectId: 'pmck-1d886',
    storageBucket: 'pmck-1d886.appspot.com',
    iosClientId: '1050632818991-6iclnv0ohnrms2ja1ktk2775cf5jd57u.apps.googleusercontent.com',
    iosBundleId: 'com.myapp.pmck',
  );
}