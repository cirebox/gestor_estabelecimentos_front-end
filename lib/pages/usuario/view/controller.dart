import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/repository.dart';

class UsuarioController extends GetxController with StateMixin {
  final UsuarioRepository repository;
  UsuarioController({required this.repository});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    this.getAll();
  }

  var id = 0.obs;
  var isEdit = false.obs;

  Future<bool> save() async {
    try {
      if (this.id.value > 0) {
        await repository.edit({
          "id": this.id.value,
          "nome": this.nome.text.trim(),
          "email": this.email.text.trim(),
          "password": this.senha.text.trim()
        }).then((data) {
          if (data.statusCode == 200) {
            Get.snackbar(
              'Atualizado com sucesso',
              data.body['message'],
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white,
              backgroundColor: Colors.greenAccent,
              duration: Duration(seconds: 6),
            );
            this.getAll();
          } else {
            Get.snackbar(
              'Não foi possível atualizar',
              data.body['message'],
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white,
              backgroundColor: Colors.red,
              duration: Duration(seconds: 6),
            );
          }
        });
      } else {
        await repository.add({
          "nome": this.nome.text.trim(),
          "email": this.email.text.trim(),
          "password": this.senha.text.trim()
        }).then((data) {
          if (data.statusCode == 201) {
            Get.snackbar(
              'Incluído com sucesso',
              data.body['message'],
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white,
              backgroundColor: Colors.greenAccent,
              duration: Duration(seconds: 6),
            );
            this.getAll();
          } else {
            Get.snackbar(
              'Não foi possível Incluir',
              data.body['message'],
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white,
              backgroundColor: Colors.red,
              duration: Duration(seconds: 6),
            );
          }
        });
      }
      this.formKey.currentState!.reset();
      this.isEdit.value = false;
      this.id.value = 0;
      return true;
    } catch (e) {
      this.id.value = 0;
      print(e);
      return false;
    }
  }

  void insert() {
    this.nome.text = '';
    this.email.text = '';
    this.senha.text = '';
    this.isEdit.value = true;
  }

  void cancelar() {
    this.isEdit.value = false;
    this.id.value = 0;
    this.formKey.currentState!.reset();
  }

  void delete(String iid) async {
    repository.delete(iid).then(
      (data) {
        if (data.statusCode == 200 || data.statusCode == 204) {
          Get.snackbar(
            'Removido',
            data.body['message'],
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.greenAccent,
            duration: Duration(seconds: 6),
          );
        } else {
          Get.snackbar(
            'Não foi possível remover',
            data.body['message'],
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red,
            duration: Duration(seconds: 6),
          );
        }
      },
    );
  }

  Future<void> getAll() async {
    change([], status: RxStatus.loading());
    try {
      final lista = await repository.getAll({});
      change(lista, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao listar!'));
    }
  }
}
