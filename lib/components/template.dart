import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vaibestabelecimento/components/content.dart';
import 'package:vaibestabelecimento/components/menu.dart';
import 'package:vaibestabelecimento/routes/app_pages.dart';
import 'package:vaibestabelecimento/shared/funcoes.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ControleTemplate extends GetxController {
  var isLogin = false.obs;
  var currentrota = "".obs;

  @override
  onInit() {
    ever(currentrota, verificaIsLogin);
  }

  verificaIsLogin(valor) async {
    if (valor == Routes.LOGIN || wsToken == "") {
      print(isLogin.value.toString());
      isLogin.value = true;
    } else {
      isLogin.value = false;
    }
  }
}

class Template extends StatefulWidget {
  Template({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  @override
  void initState() {
    super.initState();
  }

  final ctrl = Get.put(ControleTemplate());
  @override
  Widget build(BuildContext context) {
    print(ctrl.isLogin.value.toString());
    ctrl.currentrota.value = wsToken;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        print(sizingInformation.screenSize.toString());
        return Obx(
          () => Scaffold(
            //drawerScrimColor: Colors.white,
            appBar: ctrl.isLogin.value
                ? PreferredSize(
                    child: Container(),
                    preferredSize: Size(0.0, 0.0),
                  )
                : AppBar(
                    toolbarHeight: 45,
                    elevation: 0,
                    title: Text(
                      'Vai Bem Estabelecimentos',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    actions: [
                      IconButton(
                        tooltip: "Sair",
                        icon: Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          wsToken = '';
                          setStorage('auth', wsToken);
                          ctrl.isLogin.value = true;
                          Get.offAndToNamed('/login');
                        },
                      ),
                    ],
                  ),
            drawer: !sizingInformation.isDesktop
                ? Drawer(
                    child: MenuNavegacao(),
                  )
                : null,
            body: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        sizingInformation.isDesktop && !ctrl.isLogin.value
                            ? MenuNavegacao()
                            : Container(),
                        Content()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
