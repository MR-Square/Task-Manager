import 'package:get/get.dart';
import 'package:task_manager/res/routes/routes_name.dart';
import 'package:task_manager/views/home/home_view.dart';
import 'package:task_manager/views/login/forget_password_view.dart';
import 'package:task_manager/views/login/login_view.dart';
import 'package:task_manager/views/login/signup_view.dart';
import 'package:task_manager/views/splash_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashView,
          page: () => const SplashView(),
          // transition: Transition.zoom,
        ),
        GetPage(
          name: RoutesName.loginView,
          page: () => const LoginView(),
          // transition: Transition.zoom,
        ),
        GetPage(
          name: RoutesName.signupView,
          page: () => const SignupView(),
          // transition: Transition.zoom,
        ),
        GetPage(
          name: RoutesName.forgetPasswordView,
          page: () => const ForgetPasswordView(),
          // transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.homeView,
          page: () => const HomeView(),
          // transition: Transition.zoom,
        ),
      ];
}
