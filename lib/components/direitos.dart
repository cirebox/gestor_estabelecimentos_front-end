import 'package:flutter/material.dart';

class Direitos extends StatelessWidget {
  const Direitos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      constraints: BoxConstraints(maxHeight: 10),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            '@2021 | Vai Bem',
            style: TextStyle(
              fontSize: 11,
            ),
          ),
          Text(
            'Todos os direitos reservados.',
            style: TextStyle(
              fontSize: 11,
            ),
          ),
        ],
      ),
    ));
  }
}
