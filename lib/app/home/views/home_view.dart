import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:theme/app/custom_widget/build_loader.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (context) {
        return Obx(()=>buildLoader(
          isLoading: controller.isLoading.isTrue,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('HOME',style:  TextStyle(fontSize:20,color: Colors.white)),
              centerTitle: true,
              backgroundColor: Colors.blue,
            ),
            body:  Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: Switch(value: controller.value.value, activeColor:Colors.blue,onChanged: (newValue){
                      controller.value.value=!controller.value.value;
                      controller.value.value?controller.performDelayedAction():Get.changeTheme(ThemeData.light());
                    }),
                  ),
                ),
                TextButton(onPressed: (){},
                    child: const Text('Click me')),
                const SizedBox(height: 200,),
                if(controller.isLoading.value==true)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        ));
      }
    );
  }
}
