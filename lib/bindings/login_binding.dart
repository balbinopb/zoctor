import 'package:get/get.dart';
import 'package:zoctor/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // print("until here?"); 
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
