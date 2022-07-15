import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final String? texto;

  const CustomLoader({Key? key, this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircularProgressIndicator.adaptive(),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Text(
            texto ?? 'Aguarde...',
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
