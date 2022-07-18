import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResponseAssinatura {
  final String numeroSessao;
  final String codStatus;
  final String mensagem;
  final String cod;
  final String mensagemSefaz;
  ResponseAssinatura({
    required this.numeroSessao,
    required this.codStatus,
    required this.mensagem,
    required this.cod,
    required this.mensagemSefaz,
  });

  ResponseAssinatura copyWith({
    String? numeroSessao,
    String? codStatus,
    String? mensagem,
    String? cod,
    String? mensagemSefaz,
  }) {
    return ResponseAssinatura(
      numeroSessao: numeroSessao ?? this.numeroSessao,
      codStatus: codStatus ?? this.codStatus,
      mensagem: mensagem ?? this.mensagem,
      cod: cod ?? this.cod,
      mensagemSefaz: mensagemSefaz ?? this.mensagemSefaz,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numeroSessao': numeroSessao,
      'codStatus': codStatus,
      'mensagem': mensagem,
      'cod': cod,
      'mensagemSefaz': mensagemSefaz,
    };
  }

  factory ResponseAssinatura.fromSat(List<String?> consulta) {
    final consultaMap = consulta.asMap();

    final status = ResponseAssinatura(
      numeroSessao: consulta[0] ?? '',
      codStatus: consulta[1] ?? '',
      mensagem: consulta[2] ?? '',
      cod: consulta[3] ?? '',
      mensagemSefaz: consultaMap.containsKey(4) ? consulta[4]! : '',
    );

    return status;
  }

  factory ResponseAssinatura.fromMap(Map<String, dynamic> map) {
    return ResponseAssinatura(
      numeroSessao: map['numeroSessao'] as String,
      codStatus: map['codStatus'] as String,
      mensagem: map['mensagem'] as String,
      cod: map['cod'] as String,
      mensagemSefaz: map['mensagemSefaz'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseAssinatura.fromJson(String source) =>
      ResponseAssinatura.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResponseAssinatura(numeroSessao: $numeroSessao, codStatus: $codStatus, mensagem: $mensagem, cod: $cod, mensagemSefaz: $mensagemSefaz)';
  }

  @override
  bool operator ==(covariant ResponseAssinatura other) {
    if (identical(this, other)) return true;

    return other.numeroSessao == numeroSessao &&
        other.codStatus == codStatus &&
        other.mensagem == mensagem &&
        other.cod == cod &&
        other.mensagemSefaz == mensagemSefaz;
  }

  @override
  int get hashCode {
    return numeroSessao.hashCode ^
        codStatus.hashCode ^
        mensagem.hashCode ^
        cod.hashCode ^
        mensagemSefaz.hashCode;
  }
}
