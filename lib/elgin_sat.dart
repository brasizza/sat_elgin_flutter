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

  Future<String?> getPlatformVersion() async {
    return ElginSatPlatform.instance.getPlatformVersion();
  }

  Future<String?> deviceInfo() async {
    return ElginSatPlatform.instance.deviceInfo();
  }

  Future<ResponseStatus?> consultarStatusSat({int? numeroSessao, required String codigoAtivacao}) async {
    return await ElginSatPlatform.instance.consultarStatusSat(numeroSessao: numeroSessao, codigoAtivacao: codigoAtivacao);
  }

  Future<ResponseStatus?> consultarSat({int? numeroSessao}) async {
    return await ElginSatPlatform.instance.consultarSat(numeroSessao: numeroSessao);
  }

  Future<ResponseAtivacao?> ativarSat({required Map<String, dynamic> dadosAtivacao}) async {
    return await ElginSatPlatform.instance.ativarSat(dadosAtivacao: dadosAtivacao);
  }

  Future<ResponseLog?> logSat({required String codigoAtivacao}) async {
    return await ElginSatPlatform.instance.logSat(codigoAtivacao);
  }

  Future<ResponseAssinatura?> associarAssinatura({required Map<String, dynamic> assinatura}) async {
    return await ElginSatPlatform.instance.associarAssinatura(assinatura: assinatura);
  }

  Future<ResponseStatus?> desbloquearSat({required String codigoAtivacao}) async {
    return await ElginSatPlatform.instance.desbloquearSat(codigoAtivacao);
  }

  Future<ResponseStatus?> bloquearSat({required codigoAtivacao}) async {
    return await ElginSatPlatform.instance.bloquearSat(codigoAtivacao);
  }

  Future<ResponseNota?> enviarVenda({required int numeroSessao, required String codigoAtivacao, required String venda}) async {
    return await ElginSatPlatform.instance.enviarVenda(numeroSessao: numeroSessao, codigoAtivacao: codigoAtivacao, venda: venda);
  }

  Future<ResponseNota?> cancelarVenda({required int numeroSessao, required String codigoAtivacao, required String chave, required String cancelamento}) async {
    return await ElginSatPlatform.instance.cancelarVenda(numeroSessao: numeroSessao, codigoAtivacao: codigoAtivacao, chave: chave, cancelamento: cancelamento);
  }
}
