import 'package:flutter/material.dart';
import 'package:vaibestabelecimento/components/fields/fieldform.dart';
import 'package:get/get.dart';

import '../controller.dart';

class FormTela extends StatefulWidget {
  FormTela({Key? key}) : super(key: key);

  @override
  _FormTelaState createState() => _FormTelaState();
}

class _FormTelaState extends State<FormTela> {
  final ctrl = Get.find<UsuarioController>();

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
                  label: 'Email',
                  controller: ctrl.email,
                  inputType: TextInputType.emailAddress,
                  isrequired: true,
                ),
                FieldForm(
                  label: 'Senha',
                  controller: ctrl.senha,
                  inputType: TextInputType.visiblePassword,
                  isSenha: true,
                  isrequired: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
