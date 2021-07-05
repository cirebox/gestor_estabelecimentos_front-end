import 'package:vaibestabelecimento/components/fields/fieldtext.dart';

import 'package:flutter/material.dart';
import 'package:vaibestabelecimento/components/template.dart';
import 'package:vaibestabelecimento/shared/funcoes.dart';
import 'package:get/get.dart';

import '../controller.dart';
import '../../../../components/direitos.dart';

class FormLogin extends StatefulWidget {
  FormLogin({Key? key}) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  final node = FocusNode();
  final controller = Get.find<LoginController>();
  bool lembrarme = false;

  Widget _acessar() => GestureDetector(
        child: Container(
          alignment: Alignment.center,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Get.theme.primaryColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Acessar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                //  fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        onTap: () async {
          if (_formKey.currentState?.validate() != true) {
            return;
          }
          controller.auth();
          if (this.lembrarme) {
            setStorage('loginlembrarme', "true");
            setStorage('loginemail', controller.userCtrl.text);
            setStorage('loginsenha', controller.senhaCtrl.text);
          } else {
            setStorage('loginlembrarme', "false");
            setStorage('loginemail', "");
            setStorage('loginsenha', "");
          }
        },
      );
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    controller.userCtrl.text = await getStorage('loginemail');
    controller.senhaCtrl.text = await getStorage('loginsenha');
    var lembra = await getStorage('loginlembrarme') == "true";
    setState(() {
      this.lembrarme = lembra;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'VB Estabelecimentos',
            style: TextStyle(
                color: Colors.purple,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'LOGIN',
            style: TextStyle(
                color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          EditForm(
            label: 'Email',
            controller: controller.userCtrl,
            icon: Icons.email,
            inputType: TextInputType.emailAddress,
            isrequired: true,
          ),
          SizedBox(height: 8.0),
          EditForm(
            label: 'Senha',
            controller: controller.senhaCtrl,
            icon: Icons.enhanced_encryption,
            isSenha: true,
            isrequired: true,
          ),
          SizedBox(height: 5),
          Container(
            width: 340,
            child: Row(
              children: [
                Expanded(child: Container()),
                Text('Lembrar-me'),
                Checkbox(
                  activeColor: Colors.purple,
                  value: this.lembrarme,
                  onChanged: (value) {
                    setState(
                      () {
                        this.lembrarme = value!;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          _acessar(),
          Expanded(
            child: Container(),
          ),
          Direitos()
        ],
      ),
    );
  }
}
