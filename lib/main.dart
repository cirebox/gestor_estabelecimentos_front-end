import 'package:flutter/material.dart';
import 'package:vaibestabelecimento/shared/funcoes.dart';
import 'package:vaibestabelecimento/theme/app_theme.dart';
import 'components/template.dart';

void main() async {
  wsToken = await getStorage('auth');
  runApp(
    MaterialApp(
      title: "VB Gestor Estabelecimento",
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      home: Template(),
    ),
  );
}
