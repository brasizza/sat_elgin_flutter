import 'package:elgin_sat_example/app/core/consts.dart';
import 'package:elgin_sat_example/app/modules/home/controller/config_controller.dart';
import 'package:flutter/material.dart';

class ConfigSat extends StatefulWidget {
  final ConfigController controller;
  const ConfigSat({Key? key, required this.controller}) : super(key: key);

  @override
  State<ConfigSat> createState() => _ConfigSatState();
}

class _ConfigSatState extends State<ConfigSat> {
  final formKey = GlobalKey<FormState>();

  final codInstalacaoEC = TextEditingController();

  final codSerialEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    bool existeAtivacao =
        widget.controller.storage.hasData(Consts.keyCodAtivacao);
    if (existeAtivacao) {
      codInstalacaoEC.text =
          (widget.controller.storage.getData(Consts.keyCodAtivacao));
    } else {
      codInstalacaoEC.clear();
    }

    bool existeSerial = widget.controller.storage.hasData(Consts.keySerial);
    if (existeSerial) {
      codSerialEC.text = (widget.controller.storage.getData(Consts.keySerial));
    } else {
      codSerialEC.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Text('Código de ativação:'),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: codInstalacaoEC,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Serial:'),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: codSerialEC,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width * .9,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (await widget.controller.salvarDados(
                          codAtivacao: codInstalacaoEC.text,
                          codSerial: codSerialEC.text)) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Salvar dados"),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
