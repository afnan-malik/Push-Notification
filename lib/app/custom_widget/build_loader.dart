
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

Widget buildLoader({required bool isLoading,Widget? child}) {
  return ModalProgressHUD(
    inAsyncCall: isLoading,
    blur: 0.18,
    color: Colors.black,
    progressIndicator: LoadingAnimationWidget.progressiveDots(
      color: Colors.blue,
      size: 45,
    ),
    child: child!,
  );
}