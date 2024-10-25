import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

class ThemeView extends GetView<ThemeController> {
  const ThemeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          SizedBox(
            height: double.infinity,
            child: Image.network(
              '',
              errorBuilder: (context, error, stackTrace) {
                return const Text('Failed to load ');
              },
              fit: BoxFit.fill,
            ),
          ),
        ]
      )
    );
  }
}
