import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditForm extends StatefulWidget {
  final String label;
  final bool isSenha;
  final int? maxLength;
  final TextEditingController controller;
  final IconData? icon;
  final TextInputType? inputType;
  bool? isrequired = false;
  EditForm(
      {required this.label,
      required this.controller,
      this.icon,
      this.maxLength,
      this.isSenha = false,
      this.inputType = TextInputType.name,
      this.isrequired,
      Key? key})
      : super(key: key);

  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  bool exibirsenha = false;

  String? _valida(dynamic value) {
    if (widget.isrequired == true) {
      if (value.isEmpty) {
        return "Campo obrigatório";
      }
    }
    if (widget.inputType == TextInputType.emailAddress) {
      if (!GetUtils.isEmail(widget.controller.text)) {
        return "Email inválido";
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      //width: double.infinity,
      child: TextFormField(
        autofocus: false,
        obscureText: widget.isSenha ? !exibirsenha : false,
        controller: widget.controller,
        keyboardType: widget.inputType != null ? widget.inputType : null,
        validator: (value) => _valida(value),
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Get.theme.primaryColor,
          ),
          icon: widget.icon != null
              ? Icon(
                  widget.icon,
                  size: 17,
                  color: Get.theme.primaryColor,
                )
              : null,
          labelText: widget.label,
          hintText: widget.label,
          suffix: widget.isSenha
              ? InkWell(
                  onTap: () {
                    setState(
                      () {
                        exibirsenha = !exibirsenha;
                      },
                    );
                  },
                  child: exibirsenha
                      ? Icon(
                          Icons.visibility_outlined,
                          size: 20,
                          color: Get.theme.primaryColor,
                        )
                      : Icon(
                          Icons.visibility_off_outlined,
                          size: 20,
                          color: Get.theme.primaryColor,
                        ),
                )
              : null,
        ),
      ),
    );
  }
}
