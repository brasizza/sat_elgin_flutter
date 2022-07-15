import 'dart:math';

import 'package:asuka/asuka.dart' as asuka;
import 'package:elgin_sat/elgin_sat.dart';
import 'package:elgin_sat_example/app/modules/home/view/components/dialog/ativar_sat.dart';
import 'package:elgin_sat_example/app/modules/home/view/components/dialog/log_sat.dart';
import 'package:elgin_sat_example/app/modules/home/view/components/dialog/status_sat.dart';
import 'package:flutter/material.dart';

import '../../../../core/consts.dart';
import '../../controller/acoes_controller.dart';

class AcoesSat extends StatelessWidget {
  final AcoesController _controller;
  AcoesSat({Key? key, required AcoesController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ResponseNota? enviarVenda;
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5, childAspectRatio: 2),
        padding: EdgeInsets.only(left: 10, right: 10),
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
                onPressed: () async {
                  ResponseStatus? consulta = await _controller.consultarSat();
                  if (consulta != null) {
                    asuka.AsukaSnackbar.info(consulta.mensagem).show();
                  }
                },
                child: const Text("Testar sat")),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
                onPressed: () async {
                  final ResponseAtivacao? status = await asuka.showDialog(
                    barrierDismissible: true,
                    builder: (context) => AlertDialog(content: AtivarSat(controller: _controller)),
                  );

                  if (status != null) {
                    asuka.AsukaSnackbar.info(status.mensagem).show();
                  } else {
                    asuka.AsukaSnackbar.warning('Falha ao recuperar').show();
                  }
                },
                child: const Text("Ativar sat")),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
                onPressed: () async {
                  String cnpjSoftwareHouse = '16716114000172';
                  String assinaturaAC = 'SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT';
                  final status = await _controller.associarAssinatura(cnpjSH: cnpjSoftwareHouse, assinatura: assinaturaAC);
                  // final ResponseStatus = _sat.associarAssinatura()

                  if (status != null) {
                    asuka.AsukaSnackbar.info(status.mensagem).show();
                  } else {
                    asuka.AsukaSnackbar.warning('Falha ao recuperar').show();
                  }
                },
                child: const Text("Assinatura")),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
                onPressed: () {
                  _controller.consultarStatusSat(codAtivacao: _controller.storage.getData(Consts.keyCodAtivacao)).then((statusSat) {
                    if (statusSat != null) {
                      Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) => StatusSat(
                                status: statusSat,
                              )));
                      asuka.AsukaSnackbar.info(statusSat.mensagem).show();
                    } else {
                      asuka.AsukaSnackbar.warning('Falha ao recuperar').show();
                    }
                  });
                },
                child: const Text("Status sat")),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  _controller.bloquearSat(codAtivacao: _controller.storage.getData(Consts.keyCodAtivacao)).then((statusSat) {
                    if (statusSat != null) {
                      asuka.AsukaSnackbar.info(statusSat.mensagem).show();
                    } else {
                      asuka.AsukaSnackbar.warning('Falha ao recuperar').show();
                    }
                  });
                },
                child: const Text("Bloquear sat")),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
                onPressed: () {
                  _controller.desbloquearSat(codAtivacao: _controller.storage.getData(Consts.keyCodAtivacao)).then((statusSat) {
                    if (statusSat != null) {
                      asuka.AsukaSnackbar.info(statusSat.mensagem).show();
                    } else {
                      asuka.AsukaSnackbar.warning('Falha ao recuperar').show();
                    }
                  });
                },
                child: const Text("Desbloquear sat")),
          ),
          ElevatedButton(
              onPressed: () async {
                int numSessao = Random().nextInt(9999);
                String codigoAtivacao = _controller.storage.getData(Consts.keyCodAtivacao);
                String venda =
                    r'<?xml version="1.0"?> <CFe> <infCFe versaoDadosEnt="0.08"> <ide><CNPJ>16716114000172</CNPJ><signAC>SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT</signAC><numeroCaixa>001</numeroCaixa> </ide><emit><CNPJ>14200166000166</CNPJ><IE>111111111111</IE><indRatISSQN>N</indRatISSQN></emit><dest></dest><det nItem="1"> <prod> <cProd>00000000000001</cProd> <xProd>PRODUTO NFCE 1</xProd> <NCM>94034000</NCM> <CFOP>5102</CFOP> <uCom>UN</uCom> <qCom>1.0000</qCom> <vUnCom>3.51</vUnCom> <indRegra>T</indRegra> </prod> <imposto> <ICMS><ICMS00><Orig>0</Orig><CST>00</CST><pICMS>7.00</pICMS></ICMS00> </ICMS><PIS><PISAliq><CST>01</CST><vBC>6.51</vBC><pPIS>0.0165</pPIS></PISAliq> </PIS> <COFINS><COFINSAliq><CST>01</CST><vBC>6.51</vBC><pCOFINS>0.0760</pCOFINS></COFINSAliq> </COFINS> </imposto> </det> <total><DescAcrEntr><vDescSubtot>0.51</vDescSubtot></DescAcrEntr><vCFeLei12741>0.56</vCFeLei12741></total><pgto> <MP> <cMP>01</cMP> <vMP>6.51</vMP> </MP></pgto><infAdic> <infCpl>Trib aprox R$ 0,36 federal, R$ 1,24 estadual e R$ 0,00 municipal&lt;br&gt;CAIXA: 001 OPERADOR: ROOT</infCpl></infAdic></infCFe></CFe>';
                enviarVenda = await _controller.enviarVenda(venda: venda, numeroSessao: numSessao, codigoAtivacao: codigoAtivacao);
                if (enviarVenda != null) {
                  asuka.AsukaSnackbar.info(enviarVenda!.mensagem).show();
                } else {
                  asuka.AsukaSnackbar.warning('Falha ao recuperar').show();
                }
              },
              child: const Text("Enviar uma venda")),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () async {
                if (enviarVenda == null) {
                  asuka.AsukaSnackbar.alert('Nenhuma nota emitda ainda').show();
                } else {
                  int numSessao = Random().nextInt(9999);
                  String codigoAtivacao = _controller.storage.getData(Consts.keyCodAtivacao);
                  String cancel = '<CFeCanc><infCFe chCanc="${enviarVenda!.chave}"><ide><CNPJ>16716114000172</CNPJ><signAC>SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT</signAC><numeroCaixa>001</numeroCaixa></ide><emit/><dest></dest><total/></infCFe></CFeCanc>';
                  String chaveCancel = enviarVenda!.chave;
                  final cancelarNota = await _controller.cancelarVenda(numeroSessao: numSessao, codigoAtivacao: codigoAtivacao, chave: chaveCancel, cancelamento: cancel);
                  if (cancelarNota != null) {
                    asuka.AsukaSnackbar.info(cancelarNota.mensagem).show();
                  } else {
                    asuka.AsukaSnackbar.warning('Falha ao recuperar').show();
                  }
                }
                // String cancel =
                //     r'<?xml version="1.0"?> <CFe> <infCFe versaoDadosEnt="0.08"> <ide><CNPJ>16716114000172</CNPJ><signAC>SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT</signAC><numeroCaixa>001</numeroCaixa> </ide><emit><CNPJ>14200166000166</CNPJ><IE>111111111111</IE><indRatISSQN>N</indRatISSQN></emit><dest></dest><det nItem="1"> <prod> <cProd>00000000000001</cProd> <xProd>PRODUTO NFCE 1</xProd> <NCM>94034000</NCM> <CFOP>5102</CFOP> <uCom>UN</uCom> <qCom>1.0000</qCom> <vUnCom>3.51</vUnCom> <indRegra>T</indRegra> </prod> <imposto> <ICMS><ICMS00><Orig>0</Orig><CST>00</CST><pICMS>7.00</pICMS></ICMS00> </ICMS><PIS><PISAliq><CST>01</CST><vBC>6.51</vBC><pPIS>0.0165</pPIS></PISAliq> </PIS> <COFINS><COFINSAliq><CST>01</CST><vBC>6.51</vBC><pCOFINS>0.0760</pCOFINS></COFINSAliq> </COFINS> </imposto> </det> <total><DescAcrEntr><vDescSubtot>0.51</vDescSubtot></DescAcrEntr><vCFeLei12741>0.56</vCFeLei12741></total><pgto> <MP> <cMP>01</cMP> <vMP>6.51</vMP> </MP></pgto><infAdic> <infCpl>Trib aprox R$ 0,36 federal, R$ 1,24 estadual e R$ 0,00 municipal&lt;br&gt;CAIXA: 001 OPERADOR: ROOT</infCpl></infAdic></infCFe></CFe>';
                // final enviarVenda = await _controller.enviarVenda(venda: venda, numeroSessao: numSessao, codigoAtivacao: codigoAtivacao);
                // if (enviarVenda != null) {
                //   asuka.AsukaSnackbar.info(enviarVenda.mensagem).show();
                // } else {
                //   asuka.AsukaSnackbar.warning('Falha ao recuperar').show();
                // }
              },
              child: const Text("Cancelar a venda")),
          ElevatedButton(
              onPressed: () async {
                ResponseLog? logSat = await _controller.logSat(codigoAtivacao: _controller.storage.getData(Consts.keyCodAtivacao));
                if (logSat != null) {
                  asuka.AsukaSnackbar.info(logSat.mensagem).show();

                  Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) => LogSat(
                            statusText: logSat.log,
                          )));
                } else {
                  asuka.AsukaSnackbar.warning('Falha ao recuperar').show();
                }
              },
              child: const Text("Log sat")),
        ],
      ),
    );
  }
}
