import 'package:flutter/material.dart';

class CardSimples extends StatelessWidget {
  String title;
  CardSimples(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [Text(this.title)],
        ),
      ),
    );
  }
}
