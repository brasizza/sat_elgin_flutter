import 'package:elgin_sat/models/response_assinatura.dart';
import 'package:elgin_sat/models/response_ativacao.dart';
import 'package:elgin_sat/models/response_log.dart';
import 'package:elgin_sat/models/response_nota_emitida.dart';
import 'package:elgin_sat/models/response_status.dart';

import 'elgin_sat_platform_interface.dart';

export 'models/response_assinatura.dart';
export 'models/response_ativacao.dart';
export 'models/response_log.dart';
export 'models/response_nota_emitida.dart';
export 'models/response_status.dart';

class ElginSat {
  static ElginSat? _instance;
  // Avoid self isntance
  ElginSat._();
  static ElginSat get instance {
    _instance ??= ElginSat._();
    return _instance!;
  }

  // Pegar a versao do android utilizado
  Future<String?> getPlatformVersion() async {
    return ElginSatPlatform.instance.getPlatformVersion();
  }

  // Pegar o tipo de sat conectado
  Future<String?> deviceInfo() async {
    return ElginSatPlatform.instance.deviceInfo();
  }

  //Faz a consulta do status operacional e retorna um objeto [ResponseStatus] com os dados
  Future<ResponseStatus?> consultarStatusSat(
      {int? numeroSessao, required String codigoAtivacao}) async {
    return await ElginSatPlatform.instance.consultarStatusSat(
        numeroSessao: numeroSessao, codigoAtivacao: codigoAtivacao);
  }

  //Faz a consulta do status simples e retorna um objeto [ResponseStatus] com os dados
  Future<ResponseStatus?> consultarSat({int? numeroSessao}) async {
    return await ElginSatPlatform.instance
        .consultarSat(numeroSessao: numeroSessao);
  }

  //Faz a ativação do sat e retorna um objeto [ResponseAtivacao] com os dados
  Future<ResponseAtivacao?> ativarSat(
      {required Map<String, dynamic> dadosAtivacao}) async {
    return await ElginSatPlatform.instance
        .ativarSat(dadosAtivacao: dadosAtivacao);
  }

  //Extrai todos os logs do sat e retorna um  objeto [ResponseLog] com os dados
  Future<ResponseLog?> logSat({required String codigoAtivacao}) async {
    return await ElginSatPlatform.instance.logSat(codigoAtivacao);
  }

  //Faz a assinatura do sat e retorna um objeto [ResponseAssinatura] com os dados
  Future<ResponseAssinatura?> associarAssinatura(
      {required Map<String, dynamic> assinatura}) async {
    return await ElginSatPlatform.instance
        .associarAssinatura(assinatura: assinatura);
  }

  //Faz o desbloqueio do sat quando possível e retorna um  objeto [ResponseStatus] com os dados
  Future<ResponseStatus?> desbloquearSat(
      {required String codigoAtivacao}) async {
    return await ElginSatPlatform.instance.desbloquearSat(codigoAtivacao);
  }

  //Faz o bloqueio manual do sat e  retorna um  objeto [ResponseStatus] com os dados
  Future<ResponseStatus?> bloquearSat({required codigoAtivacao}) async {
    return await ElginSatPlatform.instance.bloquearSat(codigoAtivacao);
  }

  //Faz um envio de nota e retorna um objeto [ResponseNota] com os dados
  Future<ResponseNota?> enviarVenda(
      {required int numeroSessao,
      required String codigoAtivacao,
      required String venda}) async {
    return await ElginSatPlatform.instance.enviarVenda(
        numeroSessao: numeroSessao,
        codigoAtivacao: codigoAtivacao,
        venda: venda);
  }

  //Faz um cancelamento de nota e retorna um objeto [ResponseNota] com os dados
  Future<ResponseNota?> cancelarVenda(
      {required int numeroSessao,
      required String codigoAtivacao,
      required String chave,
      required String cancelamento}) async {
    return await ElginSatPlatform.instance.cancelarVenda(
        numeroSessao: numeroSessao,
        codigoAtivacao: codigoAtivacao,
        chave: chave,
        cancelamento: cancelamento);
  }
}
