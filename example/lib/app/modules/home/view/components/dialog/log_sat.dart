import 'dart:developer';

import 'package:flutter/material.dart';

class LogSat extends StatelessWidget {
  final String statusText;
  const LogSat({Key? key, required this.statusText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(statusText);
    return Scaffold(
      appBar: AppBar(title: const Text('LOG SAT')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: statusText
                .split('\n')
                .map((e) => Column(
                      children: [
                        Text(
                          e,
                          style: const TextStyle(fontSize: 10),
                          textAlign: TextAlign.justify,
                        ),
                        const Divider(),
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
