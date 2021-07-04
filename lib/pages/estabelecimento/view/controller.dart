import 'package:flutter/material.dart';
import 'package:vaibestabelecimento/pages/estabelecimento/data/model/cepmodel.dart';
import 'package:get/get.dart';
import '../data/repository/repository.dart';

class EstabelecimentoController extends GetxController with StateMixin {
  final EstabelecimentoRepository repository;
  EstabelecimentoController({required this.repository});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nome = TextEditingController();
  TextEditingController cnpj = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cep = TextEditingController();
  TextEditingController endereco = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController bairro = TextEditingController();
  TextEditingController cidade = TextEditingController();
  TextEditingController uf = TextEditingController();
  TextEditingController complemento = TextEditingController();

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
          "cnpj": this.cnpj.text.trim(),
          "telefone": this.telefone.text.trim(),
          "email": this.email.text.trim(),
          "cep": this.cep.text.trim(),
          "uf": this.uf.text.trim().toUpperCase(),
          "cidade": this.cidade.text.trim(),
          "bairro": this.bairro.text.trim(),
          "logradouro": this.endereco.text.trim(),
          "numero": this.numero.text.trim(),
          "complemento": this.complemento.text.trim(),
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
          "cnpj": this.cnpj.text.trim(),
          "telefone": this.telefone.text.trim(),
          "email": this.email.text.trim(),
          "cep": this.cep.text.trim(),
          "uf": this.uf.text.trim().toUpperCase(),
          "cidade": this.cidade.text.trim(),
          "bairro": this.bairro.text.trim(),
          "logradouro": this.endereco.text.trim(),
          "numero": this.numero.text.trim(),
          "complemento": this.complemento.text.trim(),
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
    this.cnpj.text = '';
    this.telefone.text = '';
    this.email.text = '';
    this.cep.text = '';
    this.endereco.text = '';
    this.bairro.text = '';
    this.cidade.text = '';
    this.uf.text = '';
    this.numero.text = '';
    this.complemento.text = '';
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
        if (data.body['status'] == true) {
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

  void pesquisar(String value) async {
    change([], status: RxStatus.loading());
    try {
      final lista = await repository.getAll({});
      change(lista, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao listar!'));
    }
  }

  Future<CepModel> getCep() async {
    final obj = await repository.getCep(this.cep.text.trim());
    return obj;
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
