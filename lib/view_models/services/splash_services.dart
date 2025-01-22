import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/res/constants/constants.dart';
import 'package:task_manager/res/routes/routes_name.dart';

class SplashServices {
  timer() {
    Future.delayed(
      const Duration(seconds: 3),
      isUserLoggedin,
    );
  }

  isUserLoggedin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    String? user = sp.getString(StorageKeys.user);

    if (user != null) {
      Get.offAllNamed(RoutesName.homeView);
    } else {
      Get.offAllNamed(RoutesName.loginView);
    }
  }
}
