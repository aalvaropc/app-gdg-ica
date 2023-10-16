import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  
  // create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;
  // function to initialize notifications
  Future<void> initNotifications() async{
    await Firebase.initializeApp();
    await _firebaseMessaging.requestPermission();

    // final fCMToken = await _firebaseMessaging.getToken();

    // print('Token: $fCMToken');
  }

}