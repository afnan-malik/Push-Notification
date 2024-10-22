import 'package:get/get.dart';
import 'package:theme/services/notification_services.dart';

class HomeController extends GetxController {
  RxBool value=false.obs;
  NotificationServices notificationServices=NotificationServices();
  @override
  void onInit() {
    super.onInit();
    notificationServices.requestNotificationPermission();
    notificationServices.getDeviceToken().then((value){
      print('deviceToken.$value');
    });
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
