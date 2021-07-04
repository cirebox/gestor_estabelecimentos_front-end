import 'package:vaibestabelecimento/pages/estabelecimento/view/binding.dart';
import 'package:vaibestabelecimento/pages/estabelecimento/view/index.dart';
import 'package:vaibestabelecimento/pages/login/view/binding.dart';
import 'package:vaibestabelecimento/pages/login/view/index.dart';
import 'package:vaibestabelecimento/pages/usuario/view/binding.dart';
import 'package:vaibestabelecimento/pages/usuario/view/index.dart';
import 'package:get/get.dart';

import 'middleware.dart';
part 'app_routes.dart';

class AppPages {
  static Transition transicao = Transition.fadeIn;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: transicao,
      // middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: Routes.USUARIO,
      page: () => UsuarioPage(),
      binding: UsuarioBinding(),
      transition: transicao,
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: Routes.ESTABELECIMENTO,
      page: () => EstabelecimentoPage(),
      binding: EstabelecimentoBinding(),
      transition: transicao,
      middlewares: [GlobalMiddleware()],
    ),
  ];
}
