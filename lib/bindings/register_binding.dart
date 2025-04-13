

import 'package:get/get.dart';
import 'package:zoctor/controller/register_contoller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}