import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('HomeView',style:  TextStyle(fontSize:20,color: Colors.white)),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:Obx(()=>  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Switch(value: controller.value.value, activeColor:Colors.cyan,onChanged: (newValue){
                  controller.value.value=!controller.value.value;
                  controller.value.value?Get.changeTheme(ThemeData.dark()):Get.changeTheme(ThemeData.light());
                }),
                Text(controller.value.value?"Light":"Dark",style: const TextStyle(fontSize:20),)
              ],)
            ),
          ),
        );
      }
    );
  }
}
