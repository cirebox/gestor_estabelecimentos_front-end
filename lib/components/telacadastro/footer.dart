import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  int recordCount;
  Footer({required this.recordCount, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "registros " + recordCount.toString(),
          ),
        ],
      ),
    );
  }
}
