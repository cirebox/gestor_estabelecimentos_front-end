import 'package:vaibestabelecimento/shared/restclient.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../data/repository/repository.dart';

class UsuarioBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut<UsuarioRepository>(() => UsuarioRepository(api: Get.find()));
    Get.lazyPut<UsuarioController>(
        () => UsuarioController(repository: Get.find()));
  }
}
