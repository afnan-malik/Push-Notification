import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:theme/services/notification_services.dart';
class HomeController extends GetxController {
  RxBool value=false.obs;
  NotificationServices notificationServices=NotificationServices();
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
  @override
  void onInit() {
    super.onInit();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(Get.context!);
    notificationServices.getDeviceToken().then((value){
      print('deviceToken');
      print(value);
    });
  }
  // void getNotification(){
  //   notificationServices.getDeviceToken().then((value)async{
  //     await http.post(Uri.parse(""),
  //       body: ,
  //       headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization':'key='
  //       }
  //
  //     );
  //   });
  // }
  void showLocalNotification() async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotificationsPlugin.show(
      Random().nextInt(1000), // Random ID for each notification
      'Warning',
      'Your data transfer to an other device',
      notificationDetails,
    );
  }

  var isLoading = false.obs; // Observable variable to manage loading state

  // Function to show loader for 5 seconds, then perform onTap action
  Future<void> performDelayedAction() async {
    isLoading.value = true; // Start showing the loader

    await Future.delayed(const Duration(seconds: 3));

    isLoading.value = false;
    showLocalNotification();
  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
