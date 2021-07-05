import 'package:flutter/material.dart';
import 'package:vaibestabelecimento/components/fields/combobox.dart';
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
        lista: Column(
          children: [
            FieldComboBox(
              label: 'Filtrar por Estado',
              controller: controller.ufFiltro,
              isrequired: true,
              onChanged: () {
                controller.getAll();
              },
              items: [
                {'texto': 'Todos', 'valor': ''},
                {"texto": "Acre", "valor": "AC"},
                {"texto": "Alagoas", "valor": "AL"},
                {"texto": "Amapá", "valor": "AP"},
                {"texto": "Amazonas", "valor": "AM"},
                {"texto": "Bahia", "valor": "BA"},
                {"texto": "Ceará", "valor": "CE"},
                {"texto": "Distrito Federal", "valor": "DF"},
                {"texto": "Espírito Santo", "valor": "ES"},
                {"texto": "Goiás", "valor": "GO"},
                {"texto": "Maranhão", "valor": "MA"},
                {"texto": "Mato Grosso", "valor": "MT"},
                {"texto": "Mato Grosso do Sul", "valor": "MS"},
                {"texto": "Minas Gerais", "valor": "MG"},
                {"texto": "Pará", "valor": "PA"},
                {"texto": "Paraíba", "valor": "PB"},
                {"texto": "Paraná", "valor": "PR"},
                {"texto": "Pernambuco", "valor": "PE"},
                {"texto": "Piauí", "valor": "PI"},
                {"texto": "Rio de Janeiro", "valor": "RJ"},
                {"texto": "Rio Grande do Norte", "valor": "RN"},
                {"texto": "Rio Grande do Sul", "valor": "RS"},
                {"texto": "Rondônia", "valor": "RO"},
                {"texto": "Roraima", "valor": "RR"},
                {"texto": "Santa Catarina", "valor": "SC"},
                {"texto": "São Paulo", "valor": "SP"},
                {"texto": "Sergipe", "valor": "SE"},
                {"texto": "Tocantins", "valor": "TO"}
              ],
            ),
            Divider(),
            Expanded(child: Lista()),
          ],
        ),
        form: FormTela(),
        oninsert: controller.insert,
        onsave: controller.save,
        oncancelar: controller.cancelar,
        onrefresh: controller.getAll,
      ),
    );
  }
}
