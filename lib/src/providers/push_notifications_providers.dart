
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';
import 'dart:io';



class PushNotificationProvider{

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _messagesStreamController = StreamController<String>.broadcast();

  Stream<String> get mensajes => _messagesStreamController.stream;

  initNotifications(){

    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.configure(

      onMessage: (info) async {
        print('---- onMessage ----');
        print(info);

        String argument = 'no-data';
        if(Platform.isAndroid) {
          argument = info['data']['dinbog'] ?? 'no-data';
        }

        _messagesStreamController.sink.add(argument);
      },

      onLaunch: (info) async {
        print('---- onLaunch ----');
        print(info);
      },

      onResume: (info) async {
        print('---- onResume ----');
        print(info);

        final noti = info['data']['dinbog'];
        _messagesStreamController.sink.add(noti);
      }

    );

  }

  dispose(){
    _messagesStreamController?.close();
  }
}