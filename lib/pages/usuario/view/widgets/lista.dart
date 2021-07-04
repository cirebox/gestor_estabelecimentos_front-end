import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../data/model/model.dart';
import '../controller.dart';

class Lista extends StatefulWidget {
  Lista({Key? key}) : super(key: key);

  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  final ctrl = Get.find<UsuarioController>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return ctrl.obx(
        (state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (_, index) {
              final UsuarioModel obj = state[index];
              return InkWell(
                onTap: () {},
                child: Dismissible(
                  key: Key(state[index].id.toString()),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    ctrl.delete(state[index].id.toString());
                    setState(() {
                      state.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title: Text(obj.nome!),
                    //subtitle: Text(obj.id.toString()),
                    trailing: Container(
                      width: 80,
                      child: Row(
                        children: [
                          IconButton(
                            tooltip: 'Editar',
                            icon: Icon(
                              Icons.edit,
                              size: 18.0,
                              color: Colors.amberAccent,
                            ),
                            onPressed: () async {
                              ctrl.id.value = int.parse(state[index].id);
                              ctrl.nome.text = state[index].nome ?? '';
                              ctrl.email.text = state[index].email ?? '';
                              ctrl.senha.text = state[index].passwordHash ?? '';
                              ctrl.isEdit.value = true;
                            },
                          ),
                          IconButton(
                            tooltip: 'Excluir',
                            icon: Icon(
                              Icons.delete,
                              size: 18.0,
                              color: Colors.redAccent,
                            ),
                            onPressed: () async {
                              ctrl.delete(state[index].id.toString());
                              setState(() {
                                state.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    });
  }
}
