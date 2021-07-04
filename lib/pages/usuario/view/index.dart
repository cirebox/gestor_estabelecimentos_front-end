import 'package:flutter/material.dart';
import 'package:vaibestabelecimento/components/telacadastro/body.dart';
import 'package:vaibestabelecimento/components/telacadastro/footer.dart';
import 'package:vaibestabelecimento/components/telacadastro/header.dart';
import 'package:get/get.dart';

import 'controller.dart';
import '../data/model/model.dart';
import 'widgets/form.dart';
import 'widgets/lista.dart';

class UsuarioPage extends GetView<UsuarioController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Body(
        title: 'Usuários',
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
