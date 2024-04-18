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
    apiKey: 'AIzaSyCx5w1DveLtOcTIlIDxFSKvZ9N2rJz1WMg',
    appId: '1:105275191909:web:118a460be263412799cc8c',
    messagingSenderId: '105275191909',
    projectId: 'recruitingapp2',
    authDomain: 'recruitingapp2.firebaseapp.com',
    storageBucket: 'recruitingapp2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1f83kMOtctzxPbci3NBB3Om1RE5bZCew',
    appId: '1:105275191909:android:ecd88f4cf830e65899cc8c',
    messagingSenderId: '105275191909',
    projectId: 'recruitingapp2',
    storageBucket: 'recruitingapp2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBYAQdaqQ6lBAobBW82gki4OonphjvKYZo',
    appId: '1:105275191909:ios:f0b2321e889d8e8999cc8c',
    messagingSenderId: '105275191909',
    projectId: 'recruitingapp2',
    storageBucket: 'recruitingapp2.appspot.com',
    iosBundleId: 'com.example.recruitingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBYAQdaqQ6lBAobBW82gki4OonphjvKYZo',
    appId: '1:105275191909:ios:f0b2321e889d8e8999cc8c',
    messagingSenderId: '105275191909',
    projectId: 'recruitingapp2',
    storageBucket: 'recruitingapp2.appspot.com',
    iosBundleId: 'com.example.recruitingApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCx5w1DveLtOcTIlIDxFSKvZ9N2rJz1WMg',
    appId: '1:105275191909:web:1b5e523c954f00f899cc8c',
    messagingSenderId: '105275191909',
    projectId: 'recruitingapp2',
    authDomain: 'recruitingapp2.firebaseapp.com',
    storageBucket: 'recruitingapp2.appspot.com',
  );
}
