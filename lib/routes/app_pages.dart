import 'package:get/get.dart';

import '../app/ChatScreen/bindings/theme_binding.dart';
import '../app/ChatScreen/views/theme_view.dart';
import '../app/home/bindings/home_binding.dart';
import '../app/home/views/home_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.THEME,
      page: () => const ThemeView(),
      binding: ThemeBinding(),
    ),
  ];
}
