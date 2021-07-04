import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'header.dart';

class Body extends StatefulWidget {
  String title = '';
  GlobalKey<FormState> formKey;
  bool isEdit;
  Widget form;
  Widget lista;
  VoidCallback oninsert;
  VoidCallback? onrefresh;
  VoidCallback oncancelar;
  Future<bool> Function() onsave;
  Body({
    required this.title,
    required this.formKey,
    required this.isEdit,
    required this.lista,
    required this.form,
    this.onrefresh,
    required this.oninsert,
    required this.oncancelar,
    required this.onsave,
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Widget lista() {
    if (widget.onrefresh != null) {
      return RefreshIndicator(
          onRefresh: () async {
            widget.onrefresh!();
            Future.value(true);
          },
          child: widget.lista);
    } else {
      return widget.lista;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Header(
              title: widget.title,
              isEdit: widget.isEdit,
              oninsert: widget.oninsert,
              onrefresh: widget.onrefresh,
              onsalvar: () async {
                if (widget.formKey.currentState!.validate() != true) return;
                final result = await widget.onsave();
                if (result) {
                  Get.snackbar(
                    'Registro salvo com sucesso!',
                    '',
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white,
                    backgroundColor: Colors.greenAccent,
                    duration: Duration(seconds: 6),
                  );
                } else {
                  Get.snackbar(
                    'Falha ao salvar registro',
                    '',
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white,
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 6),
                  );
                }
              },
              oncancelar: widget.oncancelar,
            ),
            Container(
              child: widget.isEdit ? widget.form : Expanded(child: lista()),
            ),
          ],
        ),
      ),
    );
  }
}
