import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices{
  FirebaseMessaging messaging=FirebaseMessaging.instance;

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

  Future<String> getDeviceToken()async{
   String? token=await messaging.getToken();
    return token!;
  }

  void refreshToken(){
    messaging.onTokenRefresh.listen((event) => event.toString);
  }
}