import 'package:vaibestabelecimento/shared/restclient.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../data/repository/repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut<LoginRepository>(() => LoginRepository(api: Get.find()));
    Get.lazyPut<LoginController>(() => LoginController(repository: Get.find()));
  }
}
