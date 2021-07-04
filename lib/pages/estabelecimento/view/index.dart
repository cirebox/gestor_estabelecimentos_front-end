import 'package:flutter/material.dart';
import 'package:vaibestabelecimento/components/telacadastro/body.dart';

import 'package:get/get.dart';

import 'controller.dart';
import 'widgets/form.dart';
import 'widgets/lista.dart';

class EstabelecimentoPage extends GetView<EstabelecimentoController> {
  @override
  Widget build(BuildContext context) {
    // print(Get.currentRoute);
    return Obx(
      () => Body(
        title: 'Estabelecimentos',
        formKey: controller.formKey,
        isEdit: controller.isEdit.value,
        lista: Lista(),
        form: FormTela(),
        oninsert: controller.insert,
        onsave: controller.save,
        oncancelar: controller.cancelar,
        onrefresh: controller.getAll,
      ),
    );
  }
}
