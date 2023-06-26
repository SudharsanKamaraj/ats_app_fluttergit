import 'package:ats_customar_app/providerApp/view/myWidget/bottom_navigation_bar_pro.dart';
import 'package:ats_customar_app/util/index_path.dart';


class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3));
    String isLogin = await storageLocal.read(key: 'isLogin') ?? "false";
    Get.to(const LoginPage());
    // if (isLogin == "true") {
    //   Get.to(const CustomBottomNavigationBar());
    // } else {
    //   Get.to(const LoginPage());
    // }
  }
}
