import 'package:get/get.dart';
import 'package:task_manager/res/routes/routes_name.dart';

class SplashServices {
  timer() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed(RoutesName.homeView);
      },
    );
  }
}
