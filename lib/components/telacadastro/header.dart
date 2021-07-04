import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  String title;
  bool isEdit = false;
  VoidCallback oninsert;
  VoidCallback? onrefresh;
  VoidCallback onsalvar;
  VoidCallback oncancelar;
  Header(
      {required this.title,
      required this.isEdit,
      required this.oninsert,
      this.onrefresh,
      required this.onsalvar,
      required this.oncancelar,
      Key? key})
      : super(key: key);

  List<Widget> action(BuildContext context) {
    if (!this.isEdit) {
      return [
        IconButton(
          tooltip: 'Incluir',
          icon: Icon(Icons.add),
          onPressed: () {
            this.oninsert();
          },
        ),
        this.onrefresh != null
            ? IconButton(
                tooltip: 'Atualizar Lista',
                icon: Icon(Icons.refresh),
                onPressed: () {
                  this.onrefresh!();
                },
              )
            : Container(),
      ];
    } else {
      return [
        IconButton(
          tooltip: 'Salvar',
          icon: Icon(
            Icons.check,
            color: Colors.green,
          ),
          onPressed: () {
            this.onsalvar();
          },
        ),
        IconButton(
          tooltip: 'Cancelar',
          icon: Icon(
            Icons.cancel_outlined,
            color: Colors.red,
          ),
          onPressed: () {
            this.oncancelar();
          },
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 30,
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    child: Text(
                      this.isEdit
                          ? this.title + ' / Ficha'
                          : this.title + ' / Lista',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: action(context),
                  ),
                ),
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
