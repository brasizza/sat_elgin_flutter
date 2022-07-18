import 'dart:convert';

import 'package:elgin_sat/core/utils.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResponseLog {
  final String numeroSessao;
  final String codStatus;
  final String mensagem;
  final String cod;
  final String mensagemSefaz;
  final String log;
  ResponseLog({
    required this.numeroSessao,
    required this.codStatus,
    required this.mensagem,
    required this.cod,
    required this.mensagemSefaz,
    required this.log,
  });

  ResponseLog copyWith({
    String? numeroSessao,
    String? codStatus,
    String? mensagem,
    String? cod,
    String? mensagemSefaz,
    String? log,
  }) {
    return ResponseLog(
      numeroSessao: numeroSessao ?? this.numeroSessao,
      codStatus: codStatus ?? this.codStatus,
      mensagem: mensagem ?? this.mensagem,
      cod: cod ?? this.cod,
      mensagemSefaz: mensagemSefaz ?? this.mensagemSefaz,
      log: log ?? this.log,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numeroSessao': numeroSessao,
      'codStatus': codStatus,
      'mensagem': mensagem,
      'cod': cod,
      'mensagemSefaz': mensagemSefaz,
      'log': log,
    };
  }

  factory ResponseLog.fromSat(List<String?> consulta) {
    final consultaMap = consulta.asMap();
    final status = ResponseLog(
        numeroSessao: consulta[0] ?? '',
        codStatus: consulta[1] ?? '',
        mensagem: consulta[2] ?? '',
        cod: consulta[3] ?? '',
        mensagemSefaz: consultaMap.containsKey(4) ? consulta[4]! : '',
        log: consultaMap.containsKey(5)
            ? ((consulta[5] ?? '') != '')
                ? Utils.base64ToString(consulta[5]!)
                : ''
            : '');

    return status;
  }

  factory ResponseLog.fromMap(Map<String, dynamic> map) {
    return ResponseLog(
      numeroSessao: map['numeroSessao'] as String,
      codStatus: map['codStatus'] as String,
      mensagem: map['mensagem'] as String,
      cod: map['cod'] as String,
      mensagemSefaz: map['mensagemSefaz'] as String,
      log: map['log'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseLog.fromJson(String source) =>
      ResponseLog.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResponseLog(numeroSessao: $numeroSessao, codStatus: $codStatus, mensagem: $mensagem, cod: $cod, mensagemSefaz: $mensagemSefaz, log: $log)';
  }

  @override
  bool operator ==(covariant ResponseLog other) {
    if (identical(this, other)) return true;

    return other.numeroSessao == numeroSessao &&
        other.codStatus == codStatus &&
        other.mensagem == mensagem &&
        other.cod == cod &&
        other.mensagemSefaz == mensagemSefaz &&
        other.log == log;
  }

  @override
  int get hashCode {
    return numeroSessao.hashCode ^
        codStatus.hashCode ^
        mensagem.hashCode ^
        cod.hashCode ^
        mensagemSefaz.hashCode ^
        log.hashCode;
  }
}
