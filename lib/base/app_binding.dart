import 'package:app_ui/core/network/controller/network_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}

