import 'dart:io';
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:theme/routes/app_pages.dart';


///push notification
class NotificationServices{
  FirebaseMessaging messaging=FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async{
    NotificationSettings settings= await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
      carPlay: true
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print("user granted permission");
    } else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print("user granted provisional permission ");
    }else{
      print("permission denied");
    }

  }



  void initLocalNotification (BuildContext context,RemoteMessage message) async{
    var androidInitialization = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var ioInitialization= const DarwinInitializationSettings();

    var initializationSettings=InitializationSettings(
      android: androidInitialization,
      iOS: ioInitialization
    );
   await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
      onDidReceiveNotificationResponse: (payload){
          handleMessages(context,message);
      }
    );
  }

  void handleMessages(BuildContext context, RemoteMessage message){
    if(message.data['type']== 'msg'){
      Get.toNamed(Routes.THEME);
    }
  }

  Future<void> setupInteractMessage(BuildContext context)async {
    ///when app is kill
    RemoteMessage? initialMessage= await FirebaseMessaging.instance.getInitialMessage();
    if(initialMessage!=null){
      handleMessages(context, initialMessage);
    }
    ///when app in backGround
    FirebaseMessaging.onMessageOpenedApp.listen((message){
      handleMessages(context, message);
    });
  }

  void firebaseInit(BuildContext context){

    FirebaseMessaging.onMessage.listen((message){
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print(message.data.toString());
        ///for android
        if(Platform.isAndroid){
          initLocalNotification(context,message);
          showNotification(message);
        }else{
          showNotification(message);
        }
    });
  }


  Future<void> showNotification( RemoteMessage message)async{


    AndroidNotificationDetails detail=AndroidNotificationDetails(
        Random.secure().nextInt(1000).toString(),
        'High Importance Notifications',
      importance: Importance.max
    );


    AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails(
        detail.channelId.toString(),
        detail.channelName.toString(),
      channelDescription: 'Your channel description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker'
    );

     const DarwinNotificationDetails ioNotificationDetails=DarwinNotificationDetails(
      presentAlert: true,
      presentBanner: true,
      presentSound: true
    );

     NotificationDetails notificationDetails=NotificationDetails(
         android: androidNotificationDetails,
         iOS: ioNotificationDetails
     );


    Future.delayed(Duration.zero,(){
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }


  Future<String> getDeviceToken()async{
   String? token=await messaging.getToken();
    return token!;
  }

  void refreshToken(){
    messaging.onTokenRefresh.listen((event) => event.toString);
  }
}