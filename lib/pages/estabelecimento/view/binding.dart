import 'package:vaibestabelecimento/shared/restclient.dart';
import 'package:get/get.dart';

import '../data/repository/repository.dart';
import 'controller.dart';

class EstabelecimentoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut<EstabelecimentoRepository>(
        () => EstabelecimentoRepository(api: Get.find()));
    Get.lazyPut<EstabelecimentoController>(
        () => EstabelecimentoController(repository: Get.find()));
  }
}
