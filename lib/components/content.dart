import 'package:flutter/material.dart';
import 'package:vaibestabelecimento/routes/app_pages.dart';
import 'package:vaibestabelecimento/shared/funcoes.dart';
import 'package:vaibestabelecimento/theme/app_theme.dart';
import 'package:get/get.dart';

class Content extends StatefulWidget {
  Content({Key? key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //color: Colors.black12,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
        child: GetMaterialApp(
          key: navigatorkey,
          debugShowCheckedModeBanner: false,
          theme: appThemeData,
          initialRoute: wsToken != '' ? Routes.ESTABELECIMENTO : Routes.LOGIN,
          getPages: AppPages.routes,
          enableLog: false,
        ),
      ),
    );
  }
}
