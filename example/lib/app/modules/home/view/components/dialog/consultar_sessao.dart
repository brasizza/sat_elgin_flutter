import 'package:asuka/asuka.dart' as asuka;
import 'package:elgin_sat_example/app/modules/home/controller/acoes_controller.dart';
import 'package:flutter/material.dart';

class ConsultarSessao extends StatefulWidget {
  final AcoesController controller;
  const ConsultarSessao({Key? key, required this.controller}) : super(key: key);

  @override
  State<ConsultarSessao> createState() => _ConsultarSessaoState();
}

class _ConsultarSessaoState extends State<ConsultarSessao> {
  final formKey = GlobalKey<FormState>();

  final numeroSessaoEC = TextEditingController();

  String dadosConsultaSessao = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Consultar"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: numeroSessaoEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Número da sessão:'),
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  String? consultarSessao = await widget.controller.consultarSessao(sessaoConsultar: numeroSessaoEC.text);

                  if (consultarSessao != null) {
                    asuka.AsukaSnackbar.info('Sessão encontrada!').show();

                    setState(() {
                      dadosConsultaSessao = consultarSessao;
                    });
                  } else {
                    asuka.AsukaSnackbar.warning('Falha ao recuperar').show();
                  }
                },
                child: const Text("Consultar"),
              ),
              Text(
                dadosConsultaSessao,
                style: const TextStyle(fontSize: 10),
              )
            ],
          )),
    );
  }
}
