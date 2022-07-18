import 'dart:developer';

import 'package:elgin_sat/elgin_sat.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'elgin_sat_platform_interface.dart';

/// An implementation of [ElginSatPlatform] that uses method channels.
class MethodChannelElginSat extends ElginSatPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('elgin_sat');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> deviceInfo() async {
    final device = await methodChannel.invokeMethod<String>('deviceInfo');

    return device;
  }

  @override
  Future<ResponseAtivacao?> ativarSat({required Map<String, dynamic> dadosAtivacao}) async {
    final ativarSat = await methodChannel.invokeMethod<String>('ativarSat', {'ativar': dadosAtivacao});
    if (ativarSat != null) {
      List<String?> consulta = ativarSat.split('|');
      if (consulta.length < 2) {
        log(consulta.toString());
        return null;
      }
      return ResponseAtivacao.fromSat(consulta);
    } else {
      return null;
    }
  }

  @override
  Future<ResponseStatus?> desbloquearSat(String codigoAtivacao) async {
    final desbloqueio = await methodChannel.invokeMethod<String>('desbloquearSat', {'codigoAtivacao': codigoAtivacao});
    if (desbloqueio != null) {
      List<String?> consulta = desbloqueio.split('|');
      if (consulta.length < 2) {
        log(consulta.toString());
        return null;
      }
      return ResponseStatus.fromSat(consulta);
    } else {
      return null;
    }
  }

  @override
  Future<ResponseStatus?> bloquearSat(codigoAtivacao) async {
    final desbloqueio = await methodChannel.invokeMethod<String>('bloquearSat', {'codigoAtivacao': codigoAtivacao});
    if (desbloqueio != null) {
      List<String?> consulta = desbloqueio.split('|');
      if (consulta.length < 2) {
        log(consulta.toString());
        return null;
      }
      return ResponseStatus.fromSat(consulta);
    } else {
      return null;
    }
  }

  @override
  Future<ResponseAssinatura?> associarAssinatura({required Map<String, dynamic> assinatura}) async {
    final ativarSat = await methodChannel.invokeMethod<String>('associarAssinatura', {'associar': assinatura});
    if (ativarSat != null) {
      List<String?> consulta = ativarSat.split('|');
      if (consulta.length < 2) {
        log(consulta.toString());
        return null;
      }
      return ResponseAssinatura.fromSat(consulta);
    } else {
      return null;
    }
  }

  @override
  Future<ResponseLog?> logSat(String codigoAtivacao) async {
    final consultarLog = await methodChannel.invokeMethod<String>('logSat', {'codigoAtivacao': codigoAtivacao});
    if (consultarLog != null) {
      List<String?> consulta = consultarLog.split('|');
      if (consulta.length < 2) {
        log(consulta.toString());
        return null;
      }
      return ResponseLog.fromSat(consulta);
    } else {
      return null;
    }
  }

  @override
  Future<ResponseStatus?> consultarSat({int? numeroSessao}) async {
    final consultaSat = await methodChannel.invokeMethod<String>('consultarSat', {'numeroSessao': numeroSessao});
    if (consultaSat != null) {
      List<String?> consulta = consultaSat.split('|');
      if (consulta.length < 2) {
        log(consulta.toString());
        return null;
      }
      return ResponseStatus.fromSat(consulta);
    } else {
      return null;
    }
  }

  @override
  Future<ResponseStatus?> consultarStatusSat({int? numeroSessao, required codigoAtivacao}) async {
    final consultaSat = await methodChannel.invokeMethod<String>('statusOperacional', {'numeroSessao': numeroSessao, 'codigoAtivacao': codigoAtivacao});
    if (consultaSat != null) {
      List<String?> consulta = consultaSat.split('|');
      if (consulta.length < 2) {
        log(consulta.toString());
        return null;
      }
      return ResponseStatus.fromSat(consulta);
    } else {
      return null;
    }
  }

  @override
  Future<ResponseNota?> enviarVenda({required int numeroSessao, required String codigoAtivacao, required String venda}) async {
    final enviaVenda = await methodChannel.invokeMethod<String>('enviarVenda', {'numeroSessao': numeroSessao, 'codigoAtivacao': codigoAtivacao, 'xml': venda});
    if (enviaVenda != null) {
      List<String?> consulta = enviaVenda.split('|');
      if (consulta.length < 2) {
        log(consulta.toString());
        return null;
      }
      return ResponseNota.fromSat(consulta);
    } else {
      return null;
    }
  }

  @override
  Future testeFimAFim({required int numeroSessao, required String codigoAtivacao, required String venda}) async {
    final enviaVenda = await methodChannel.invokeMethod<String>('testeFimaFim', {'numeroSessao': numeroSessao, 'codigoAtivacao': codigoAtivacao, 'xml': venda});
    if (enviaVenda != null) {
      List<String?> consulta = enviaVenda.split('|');
      if (consulta.length < 2) {
        log(consulta.toString());
        return null;
      }
      return ResponseNota.fromSat(consulta);
    } else {
      return null;
    }
  }

  @override
  Future<ResponseNota?> cancelarVenda({required int numeroSessao, required String codigoAtivacao, required String chave, required String cancelamento}) async {
    Map<String, dynamic> dadosCancelamento = {'cFeCancelar': chave, 'xmlCancelamento': cancelamento};
    final cancelaVenda = await methodChannel.invokeMethod<String>('cancelarVenda', {'numeroSessao': numeroSessao, 'codigoAtivacao': codigoAtivacao, 'dadosCancelamento': dadosCancelamento});
    if (cancelaVenda != null) {
      List<String?> consulta = cancelaVenda.split('|');
      if (consulta.length < 2) {
        log(consulta.toString());
        return null;
      }
      return ResponseNota.fromSat(consulta);
    } else {
      return null;
    }
  }

  @override
  Future<String?> consultarSessao({required String codigoAtivacao, String? sessaoConsultar}) async {
    final consulta = await methodChannel.invokeMethod<String>('consultarSessao', {'codigoAtivacao': codigoAtivacao, 'sessaoConsultar': int.parse(sessaoConsultar.toString())});
    return consulta;
  }

  @override
  Future<String?> atualizarSoftware({required codigoAtivacao}) async {
    final consulta = await methodChannel.invokeMethod<String>('atualizarSoftware', {'codigoAtivacao': codigoAtivacao});
    return consulta;
  }
}
