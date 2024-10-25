import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:theme/services/notification_services.dart';
class HomeController extends GetxController {
  RxBool value=false.obs;
  RxBool isLoading = false.obs;
  NotificationServices notificationServices=NotificationServices();
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
  @override
  void onInit() {
    super.onInit();
    notificationServices.requestNotificationPermission();
    notificationServices.getDeviceToken().then((value){
      print('deviceToken');
      print(value);
    });
    notificationServices.firebaseInit(Get.context!);

  }

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
      'Testing......................',
      notificationDetails,
    );

  }


  /// Function to show loader for 5 seconds,
  Future<void> performDelayedAction() async {
    isLoading.value=true;
    showLocalNotification();
    await Future.delayed(const Duration(seconds: 8));
    isLoading.value=false;
    // Get.toNamed(Routes.THEME);
    // Get.snack bar(
    //     "Warning",
    //     "Data Transfer successfully",
    //   backgroundColor: Colors.red,
    //   icon: Icon(Icons.error_outlined),
    //   colorText: Colors.white
    // );
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
