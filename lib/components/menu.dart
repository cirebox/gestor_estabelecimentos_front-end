import 'package:flutter/material.dart';
import 'package:vaibestabelecimento/routes/app_pages.dart';
import 'package:vaibestabelecimento/theme/color_theme.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MenuNavegacao extends StatefulWidget {
  MenuNavegacao({Key? key}) : super(key: key);

  @override
  _MenuNavegacaoState createState() => _MenuNavegacaoState();
}

class _MenuNavegacaoState extends State<MenuNavegacao> {
  @override
  Widget build(BuildContext context) {
    print(Get.currentRoute);
    return Container(
      constraints: BoxConstraints(maxWidth: 180),
      padding: EdgeInsets.only(top: 15.0, left: 5),
      color: colorMenu,
      child: ListView(
        padding: EdgeInsets.zero,
        primary: true,
        children: [
          Text(
            'Menu',
            style: textStyle,
          ),
          Divider(),
          drawerItem(
              'Estabelecimento', Icons.home_rounded, Routes.ESTABELECIMENTO),
          drawerItem('Usuário', Icons.person, Routes.USUARIO),
        ],
      ),
    );
  }

  TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 14);

  Widget drawerItem(
    String nome,
    IconData icon,
    String rota,
  ) =>
      ListTile(
        horizontalTitleGap: 1,
        selectedTileColor: Theme.of(context).primaryColor,
        dense: true,
        selected: Get.currentRoute == rota ? true : false,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          nome,
          style: textStyle,
        ),
        onTap: () {
          var deviceType = getDeviceType(MediaQuery.of(Get.context!).size);
          if (deviceType != DeviceScreenType.desktop) {
            Navigator.pop(context);
          }
          Get.offAndToNamed(rota);
        },
      );
}
