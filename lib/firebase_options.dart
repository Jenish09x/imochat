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
    apiKey: 'AIzaSyBcISB02Z9l1LCjll7lReGKAOBDNExvcl8',
    appId: '1:713388994881:web:86d8177f9accfb8129f1c0',
    messagingSenderId: '713388994881',
    projectId: 'imochat-7e97a',
    authDomain: 'imochat-7e97a.firebaseapp.com',
    storageBucket: 'imochat-7e97a.appspot.com',
    measurementId: 'G-04G0GSGM8Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfzUrE5rwsWzlieKUGHv_A8tashBTt3rQ',
    appId: '1:713388994881:android:99b694eb6d89418c29f1c0',
    messagingSenderId: '713388994881',
    projectId: 'imochat-7e97a',
    storageBucket: 'imochat-7e97a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6LkDwtqv65waLR_3l1-aPsNOeP2kul90',
    appId: '1:713388994881:ios:2977898136d5da4629f1c0',
    messagingSenderId: '713388994881',
    projectId: 'imochat-7e97a',
    storageBucket: 'imochat-7e97a.appspot.com',
    iosBundleId: 'com.example.imochat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6LkDwtqv65waLR_3l1-aPsNOeP2kul90',
    appId: '1:713388994881:ios:f483d991528411f929f1c0',
    messagingSenderId: '713388994881',
    projectId: 'imochat-7e97a',
    storageBucket: 'imochat-7e97a.appspot.com',
    iosBundleId: 'com.example.imochat.RunnerTests',
  );
}
