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
          body:  Column(
            children: [
              Obx(()=>  Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Switch(value: controller.value.value, activeColor:Colors.blue,onChanged: (newValue){
                    controller.value.value=!controller.value.value;
                    controller.value.value?controller.performDelayedAction():Get.changeTheme(ThemeData.light());
                  }),
                ),
              )),

              TextButton(onPressed: (){},
                  child: const Text('Click me'))
            ],
          ),
        );
      }
    );
  }
}
