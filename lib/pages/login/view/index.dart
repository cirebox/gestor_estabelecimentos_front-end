import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vaibestabelecimento/pages/login/view/widgets/form.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'controller.dart';

class LoginPage extends GetView<LoginController> {
  int getRandomInt(min, max) {
    Random rnd = new Random();
    int num = min + rnd.nextInt(max - min);
    // print("imagem $num de $min até $max");
    return num;
  }

  @override
  Widget build(BuildContext context) {
    var imagem = getRandomInt(1, 4);
    return Scaffold(
      body: SafeArea(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType ==
                DeviceScreenType.desktop) {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                body: SingleChildScrollView(
                  child: Container(
                    height: Get.mediaQuery.size.height,
                    width: Get.mediaQuery.size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'images/bg' + imagem.toString() + '.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: 500,
                            maxWidth: 350,
                          ),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: FormLogin(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                body: Container(
                  height: Get.mediaQuery.size.height,
                  width: Get.mediaQuery.size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          constraints: BoxConstraints(
                            maxHeight: 500,
                            maxWidth: 350,
                          ),
                          child: FormLogin(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
