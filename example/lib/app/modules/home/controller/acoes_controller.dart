import 'dart:convert';

import 'package:asyncstate/asyncstate.dart';
import 'package:elgin_sat/elgin_sat.dart';
import 'package:elgin_sat_example/app/core/consts.dart';
import 'package:elgin_sat_example/app/core/local_storage/local_storage.dart';

class AcoesController with AsyncStateMixin {
  static AcoesController? _instance;
  late final LocalStorage storage;

  // Avoid self isntance
  AcoesController._({required LocalStorage localStorage}) {
    storage = localStorage;
  }
  factory AcoesController.instance({required LocalStorage localStorage}) {
    _instance ??= AcoesController._(localStorage: localStorage);
    return _instance!;
  }

  Future<ResponseAtivacao?> ativarSat({required String codAtivacao, required String cnpj, required String uf, required String certificado}) async {
    final Map<String, dynamic> ativacao = {
      'subComando': int.parse(certificado),
      'codAtivacao': (codAtivacao),
      'cnpj': (cnpj),
      'cUF': int.parse(uf),
    };
    return await ElginSat.instance.ativarSat(dadosAtivacao: ativacao).asyncLoader();
  }

  Future<ResponseAssinatura?> associarAssinatura({required String cnpjSH, required String assinatura}) async {
    await storage.setData(Consts.keyCNPJSH, cnpjSH);

    String codAtivacao = storage.getData(Consts.keyCodAtivacao);
    String cnpjContribuinte = storage.getData(Consts.keyCNPJ);
    final Map<String, dynamic> assinaturaSat = {
      'codAtivacao': (codAtivacao),
      'cnpjSh': (cnpjSH) + (cnpjContribuinte),
      'assinaturaAC': assinatura,
    };
    return await ElginSat.instance.associarAssinatura(assinatura: assinaturaSat).asyncLoader();
  }

  Future<ResponseStatus?> consultarStatusSat({required codAtivacao}) async {
    return await ElginSat.instance.consultarStatusSat(codigoAtivacao: codAtivacao).asyncLoader();
  }

  Future<Map<String, dynamic>?> pegarModeloSat() async {
    final device = await ElginSat.instance.deviceInfo().asyncLoader();
    if (device != null) {
      return json.decode(device);
    }
    return null;
  }

  Future<ResponseStatus?> consultarSat() async {
    return await ElginSat.instance.consultarSat().asyncLoader();
  }

  Future<ResponseStatus?> desbloquearSat({required String codAtivacao}) async {
    return await ElginSat.instance.desbloquearSat(codigoAtivacao: codAtivacao).asyncLoader();
  }

  Future<ResponseLog?> logSat({required String codigoAtivacao}) async {
    return await ElginSat.instance.logSat(codigoAtivacao: codigoAtivacao).asyncLoader();
  }

  Future<ResponseStatus?> bloquearSat({required codAtivacao}) async {
    return await ElginSat.instance.bloquearSat(codigoAtivacao: codAtivacao).asyncLoader();
  }

  Future<ResponseNota?> enviarVenda({required String venda, required int numeroSessao, required String codigoAtivacao}) async {
    return await ElginSat.instance.enviarVenda(numeroSessao: numeroSessao, codigoAtivacao: codigoAtivacao, venda: venda).asyncLoader();
  }

  Future<ResponseNota?> cancelarVenda({required int numeroSessao, required String codigoAtivacao, required String chave, required String cancelamento}) async {
    return await ElginSat.instance.cancelarVenda(numeroSessao: numeroSessao, codigoAtivacao: codigoAtivacao, chave: chave, cancelamento: cancelamento).asyncLoader();
  }

  Future<ResponseNota?> testeFimAFim({required String venda, required int numeroSessao, required String codigoAtivacao}) async {
    return await ElginSat.instance.testeFimAFim(numeroSessao: numeroSessao, codigoAtivacao: codigoAtivacao, venda: venda).asyncLoader();
  }

  Future<String?> consultarSessao({String? sessaoConsultar}) async {
    String codigoAtivacao = storage.getData(Consts.keyCodAtivacao);
    return await ElginSat.instance.consultarSessao(codigoAtivacao: codigoAtivacao, sessaoConsultar: sessaoConsultar).asyncLoader();
  }

  Future<String?> atualizarSoftware({required codigoAtivacao}) async {
    return await ElginSat.instance.atualizarSoftware(codigoAtivacao: codigoAtivacao).asyncLoader();
  }
}
