import 'package:flutter/material.dart';

class FieldComboBox extends StatefulWidget {
  final String? label;
  bool? isrequired = false;
  List<Map<String, String>> items = [];
  final TextEditingController controller;
  FieldComboBox(
      {this.label,
      required this.items,
      this.isrequired,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  _FieldComboBoxState createState() => _FieldComboBoxState();
}

class _FieldComboBoxState extends State<FieldComboBox> {
  String? _valida(dynamic value) {
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
      child: DropdownButtonFormField(
          style: TextStyle(fontSize: 12, color: Colors.black),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: widget.label,
            hintText: widget.label,
          ),
          value: widget.controller.text.isEmpty ? '' : widget.controller.text,
          items: widget.items
              .map((item) => DropdownMenuItem(
                    child: Text(item['texto']!),
                    value: item['valor']!,
                  ))
              .toList(),
          validator: _valida,
          onChanged: (String? value) {
            setState(() {
              widget.controller.text = value!;
            });
          },
          hint: Text("Selecione o tipo")),
    );
  }
}
