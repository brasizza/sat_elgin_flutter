import 'package:elgin_sat/elgin_sat.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'elgin_sat_method_channel.dart';

abstract class ElginSatPlatform extends PlatformInterface {
  /// Constructs a ElginSatPlatform.
  ElginSatPlatform() : super(token: _token);

  static final Object _token = Object();

  static ElginSatPlatform _instance = MethodChannelElginSat();

  /// The default instance of [ElginSatPlatform] to use.
  ///
  /// Defaults to [MethodChannelElginSat].
  static ElginSatPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ElginSatPlatform] when
  /// they register themselves.
  static set instance(ElginSatPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> deviceInfo() {
    throw UnimplementedError('deviceInfo() has not been implemented.');
  }

  Future<ResponseStatus?> consultarStatusSat({int? numeroSessao, required String codigoAtivacao}) {
    throw UnimplementedError('consultarStatusSat() has not been implemented.');
  }

  Future<ResponseStatus?> consultarSat({int? numeroSessao}) {
    throw UnimplementedError('consultarSat() has not been implemented.');
  }

  Future<ResponseAtivacao?> ativarSat({required Map<String, dynamic> dadosAtivacao}) {
    throw UnimplementedError('ativarSat() has not been implemented.');
  }

  Future<ResponseLog?> logSat(String codigoAtivacao) {
    throw UnimplementedError('logSat() has not been implemented.');
  }

  Future<ResponseAssinatura?> associarAssinatura({required Map<String, dynamic> assinatura}) {
    throw UnimplementedError('associarAssinatura() has not been implemented.');
  }

  Future<ResponseStatus?> desbloquearSat(String codigoAtivacao) {
    throw UnimplementedError('desbloquearSat() has not been implemented.');
  }

  Future<ResponseStatus?> bloquearSat(codigoAtivacao) {
    throw UnimplementedError('bloquearSat() has not been implemented.');
  }

  Future<ResponseNota?> enviarVenda({required int numeroSessao, required String codigoAtivacao, required String venda}) {
    throw UnimplementedError('enviarVenda() has not been implemented.');
  }

  Future<ResponseNota?> cancelarVenda({required int numeroSessao, required String codigoAtivacao, required String chave, required String cancelamento}) {
    throw UnimplementedError('cancelarVenda() has not been implemented.');
  }
}
