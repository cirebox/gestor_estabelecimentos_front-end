import 'package:flutter/material.dart';
import 'package:vaibestabelecimento/components/template.dart';
import 'package:vaibestabelecimento/routes/app_pages.dart';
import 'package:vaibestabelecimento/shared/funcoes.dart';
import 'package:get/get.dart';
import '../data/repository/repository.dart';

class LoginController extends GetxController with StateMixin {
  final LoginRepository repository;
  LoginController({required this.repository});

  final TextEditingController userCtrl = TextEditingController();
  final TextEditingController senhaCtrl = TextEditingController();

  void auth() async {
    repository.auth(
      {
        "email": userCtrl.text,
        "password": senhaCtrl.text,
      },
    ).then((data) {
      if (data.body['token'] != null) {
        if (data.body['token'] != '') {
          wsToken = data.body['token'];
          setStorage('auth', wsToken);
          Get.put(ControleTemplate()).isLogin.value = false;
          Get.offNamed(Routes.ESTABELECIMENTO);
        }
      } else {
        wsToken = '';
        setStorage('auth', wsToken);
        Get.snackbar(
          'Não foi possível autenticar',
          data.body['message'],
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          duration: Duration(seconds: 6),
        );
      }
    });
  }
}
