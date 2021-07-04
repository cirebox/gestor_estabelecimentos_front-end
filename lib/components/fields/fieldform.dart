import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FieldForm extends StatefulWidget {
  final String label;
  final bool isSenha;
  final int? maxLength;
  final TextEditingController controller;
  final IconData? icon;
  final IconData? suffixicon;
  final void Function()? onsuffix;
  final TextInputType? inputType;
  bool? isrequired = false;
  FieldForm(
      {required this.label,
      required this.controller,
      this.icon,
      this.maxLength,
      this.isSenha = false,
      this.inputType = TextInputType.name,
      this.isrequired,
      this.suffixicon,
      this.onsuffix,
      Key? key})
      : super(key: key);

  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<FieldForm> {
  bool exibirsenha = false;

  String? _valida(dynamic value) {
    if (!value.isEmpty) {
      if (widget.inputType == TextInputType.emailAddress) {
        if (!GetUtils.isEmail(widget.controller.text)) {
          return "Email inválido";
        }
      }
    }

    if (widget.isrequired == true) {
      if (value.isEmpty) {
        return "Campo obrigatório";
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400, maxHeight: 100),
      child: TextFormField(
        autofocus: false,
        obscureText: widget.isSenha ? !exibirsenha : false,
        controller: widget.controller,
        keyboardType: widget.inputType != null ? widget.inputType : null,
        validator: (value) => _valida(value),
        maxLength: widget.maxLength,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: widget.icon != null
              ? Icon(
                  widget.icon,
                  size: 17,
                )
              : null,
          labelText: widget.label,
          hintText: widget.label,
          suffix: suffix(),
        ),
      ),
    );
  }

  Widget suffix() {
    if (widget.isSenha) {
      return InkWell(
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
                //  color: Get.theme.primaryColor,
              )
            : Icon(
                Icons.visibility_off_outlined,
                size: 20,
                // color: Get.theme.primaryColor,
              ),
      );
    } else {
      if (widget.suffixicon != null && widget.onsuffix != null) {}
      return InkWell(
        onTap: widget.onsuffix,
        child: Icon(
          widget.suffixicon,
          size: 20,
        ),
      );
    }
  }
}
