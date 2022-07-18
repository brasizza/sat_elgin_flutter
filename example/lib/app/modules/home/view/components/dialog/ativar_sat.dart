import 'package:elgin_sat_example/app/core/consts.dart';
import 'package:elgin_sat_example/app/modules/home/controller/acoes_controller.dart';
import 'package:flutter/material.dart';

class AtivarSat extends StatefulWidget {
  final AcoesController controller;
  const AtivarSat({Key? key, required this.controller}) : super(key: key);

  @override
  State<AtivarSat> createState() => _AtivarSatState();
}

class _AtivarSatState extends State<AtivarSat> {
  final formKey = GlobalKey<FormState>();

  final codAtivacaoEC = TextEditingController();

  final tipoCertificadoEC = TextEditingController();

  final codigoUFEC = TextEditingController();

  final cnpjEC = TextEditingController();

  @override
  void initState() {
    super.initState();

    bool existeAtivacao =
        widget.controller.storage.hasData(Consts.keyCodAtivacao);
    if (existeAtivacao) {
      codAtivacaoEC.text =
          (widget.controller.storage.getData(Consts.keyCodAtivacao));
    } else {
      codAtivacaoEC.clear();
    }

    bool existeCNPJ = widget.controller.storage.hasData(Consts.keyCNPJ);
    if (existeCNPJ) {
      cnpjEC.text = (widget.controller.storage.getData(Consts.keyCNPJ));
    } else {
      cnpjEC.clear();
    }

    bool existeCertificado =
        widget.controller.storage.hasData(Consts.keyTIPOCERTIFICADO);
    if (existeCertificado) {
      tipoCertificadoEC.text =
          (widget.controller.storage.getData(Consts.keyTIPOCERTIFICADO));
    } else {
      tipoCertificadoEC.clear();
    }

    bool existeCodigoUF = widget.controller.storage.hasData(Consts.keyCODUF);
    if (existeCodigoUF) {
      codigoUFEC.text = (widget.controller.storage.getData(Consts.keyCODUF));
    } else {
      codigoUFEC.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Ativação do SAT!"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: codAtivacaoEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Código de ativação:'),
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cnpjEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('CNPJ:'),
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: tipoCertificadoEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Tipo de certificado:'),
                    hintText: '1 ou 2 ',
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: codigoUFEC,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text('Código UF:'),
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await widget.controller.storage
                      .setData(Consts.keyCNPJ, cnpjEC.text);
                  await widget.controller.storage
                      .setData(Consts.keyCodAtivacao, codAtivacaoEC.text);
                  await widget.controller.storage.setData(
                      Consts.keyTIPOCERTIFICADO, tipoCertificadoEC.text);
                  await widget.controller.storage
                      .setData(Consts.keyCODUF, codigoUFEC.text);
                  widget.controller
                      .ativarSat(
                    codAtivacao: codAtivacaoEC.text,
                    cnpj: cnpjEC.text,
                    uf: codigoUFEC.text,
                    certificado: tipoCertificadoEC.text,
                  )
                      .then((ativar) {
                    Navigator.pop(context, ativar);
                  });
                  // if (await widget.controller.salvarDados(codAtivacao: codInstalacaoEC.text, codSerial: codSerialEC.text)) {
                  //   Navigator.pop(context);
                  // }
                },
                child: const Text("Ativar sat"),
              )
            ],
          )),
    );
  }
}
