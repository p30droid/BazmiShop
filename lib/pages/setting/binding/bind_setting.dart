import 'package:bazmi_shop/pages/setting/controller/counter_controller.dart';
import 'package:bazmi_shop/pages/setting/controller/setting_service.dart';
import 'package:get/get.dart';

class BindSetting extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(SettingService());

    Get.put(CounterController());
  }
}
