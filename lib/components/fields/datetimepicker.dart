import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FieldDateTime extends StatefulWidget {
  String label;
  bool? isrequired = false;
  TextInputType? inputType;
  final TextEditingController controller;
  FieldDateTime(
      {required this.label,
      required this.controller,
      this.isrequired,
      this.inputType,
      Key? key})
      : super(key: key);

  @override
  _DateTimeFieldState createState() => _DateTimeFieldState();
}

class _DateTimeFieldState extends State<FieldDateTime> {
  String? _valida(DateTime? value) {
    if (widget.isrequired == true) {
      if (value == null) {
        return "Campo obrigatório";
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd/MM/yyyy");
    return Container(
      constraints: BoxConstraints(maxWidth: 400, minHeight: 54, maxHeight: 100),
      child: DateTimeField(
        autofocus: false,
        controller: widget.controller,
        validator: (value) => _valida(value),
        keyboardType: widget.inputType != null ? widget.inputType : null,
        format: format,
        maxLines: 1,
        minLines: null,
        style: TextStyle(fontSize: 12),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.label,
          hintText: widget.label,
          contentPadding: EdgeInsets.only(top: 50.0, left: 10),
        ),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
            context: context,
            errorFormatText: 'Formato inválido',
            errorInvalidText: 'Esta data é inválida',
            helpText: 'Selecione a data',
            fieldLabelText: widget.label,
            fieldHintText: widget.label,
            confirmText: "OK",
            cancelText: "Cancelar",
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100),
          );
        },
        onChanged: (date) {
          if (date != null) {
            widget.controller.text = DateFormat("dd/MM/yyyy").format(date);
          }
        },
      ),
    );
  }
}
