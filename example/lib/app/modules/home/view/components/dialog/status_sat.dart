import 'dart:ui';

import 'package:elgin_sat/models/response_status.dart';
import 'package:flutter/material.dart';

class StatusSat extends StatelessWidget {
  final ResponseStatus status;
  const StatusSat({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Status SAT')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Número da sessão: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.numeroSessao,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Código de status: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.codStatus,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Sefaz: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.mensagemSefaz,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Número de serie: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.nserieSat,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Tipo de rede: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.tipoLan,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'IP: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.lanIp,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Mac: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.lanMac,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Gateway: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.lanGateway,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'DNS: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      "${status.lanDns}/${status.lanDns2}",
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Status rede: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.statusLan,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Bateria: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.nivelBateria,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Memória Total: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.memoriaTotal,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Memória usada',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.memoriaUsada,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Data: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.dataAtual,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Versão software: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.versaoSoftwareSat,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Layout sefaz: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.versaoLayout,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Último CFe: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.ultimoCfe,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Inicial: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.numeroInicial,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Final: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.numeroFinal,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Data última CFe: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.dataUltimaCfe,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Comunicação Sefaz: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.dataComunicacaoSefaz,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Data certificado: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.dataEmissaoCertificado,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Vencimento certificado: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      status.dataVencimentoCertificado,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
