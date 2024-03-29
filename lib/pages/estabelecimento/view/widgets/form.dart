import 'package:flutter/material.dart';
import 'package:vaibestabelecimento/components/fields/combobox.dart';
import 'package:vaibestabelecimento/components/fields/datetimepicker.dart';
import 'package:vaibestabelecimento/components/fields/fieldform.dart';
import 'package:get/get.dart';

import '../controller.dart';

class FormTela extends StatefulWidget {
  FormTela({Key? key}) : super(key: key);

  @override
  _FormTelaState createState() => _FormTelaState();
}

class _FormTelaState extends State<FormTela> {
  final ctrl = Get.find<EstabelecimentoController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: ctrl.formKey,
            child: Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              // direction: Axis.vertical,
              // runAlignment: WrapAlignment.start,
              // alignment: WrapAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Dados'),
                    Divider(),
                  ],
                ),
                FieldForm(
                  label: 'Nome',
                  controller: ctrl.nome,
                  isrequired: true,
                  maxLength: 70,
                ),
                FieldForm(
                  label: 'CNPJ',
                  controller: ctrl.cnpj,
                  inputType: TextInputType.number,
                  isrequired: true,
                  maxLength: 14,
                ),
                Row(
                  children: [
                    Text('Contato'),
                    Divider(),
                  ],
                ),
                FieldForm(
                  label: 'Telefone',
                  maxLength: 16,
                  controller: ctrl.telefone,
                  inputType: TextInputType.phone,
                  suffixicon: Icons.phone,
                  onsuffix: () {},
                ),
                FieldForm(
                  label: 'Email',
                  maxLength: 150,
                  controller: ctrl.email,
                  inputType: TextInputType.emailAddress,
                  suffixicon: Icons.email_outlined,
                  onsuffix: () {},
                ),
                Row(
                  children: [
                    Text('Endereço'),
                    Divider(),
                  ],
                ),
                FieldForm(
                  label: 'Cep',
                  controller: ctrl.cep,
                  inputType: TextInputType.number,
                  suffixicon: Icons.search_outlined,
                  maxLength: 10,
                  onsuffix: () async {
                    final objcep = await ctrl.getCep();
                    ctrl.endereco.text = objcep.logradouro!;
                    ctrl.complemento.text = objcep.complemento!;
                    ctrl.bairro.text = objcep.bairro!;
                    ctrl.cidade.text = objcep.localidade!;
                    setState(() {
                      ctrl.uf.text = objcep.uf!;
                    });
                  },
                ),
                FieldForm(
                  label: 'Endereço',
                  controller: ctrl.endereco,
                  maxLength: 70,
                ),
                FieldForm(
                  label: 'Número',
                  controller: ctrl.numero,
                  maxLength: 20,
                ),
                FieldForm(
                  label: 'Bairro',
                  controller: ctrl.bairro,
                  maxLength: 30,
                ),
                FieldForm(
                  label: 'Cidade',
                  controller: ctrl.cidade,
                  maxLength: 30,
                ),
                FieldComboBox(
                  label: 'Estado',
                  controller: ctrl.uf,
                  isrequired: true,
                  items: [
                    {'texto': '', 'valor': ''},
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
                FieldForm(
                  label: 'Complemento',
                  controller: ctrl.complemento,
                  maxLength: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
