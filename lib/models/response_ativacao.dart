import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResponseAtivacao {
  final String numeroSessao;
  final String codStatus;
  final String mensagem;
  final String cod;
  final String mensagemSefaz;
  ResponseAtivacao({
    required this.numeroSessao,
    required this.codStatus,
    required this.mensagem,
    required this.cod,
    required this.mensagemSefaz,
  });

  ResponseAtivacao copyWith({
    String? numeroSessao,
    String? codStatus,
    String? mensagem,
    String? cod,
    String? mensagemSefaz,
  }) {
    return ResponseAtivacao(
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

  factory ResponseAtivacao.fromSat(List<String?> consulta) {
    final consultaMap = consulta.asMap();
    final status = ResponseAtivacao(
      numeroSessao: consulta[0] ?? '',
      codStatus: consulta[1] ?? '',
      mensagem: consulta[2] ?? '',
      cod: consulta[3] ?? '',
      mensagemSefaz: consultaMap.containsKey(4) ? consulta[4]! : '',
    );

    return status;
  }

  factory ResponseAtivacao.fromMap(Map<String, dynamic> map) {
    return ResponseAtivacao(
      numeroSessao: map['numeroSessao'] as String,
      codStatus: map['codStatus'] as String,
      mensagem: map['mensagem'] as String,
      cod: map['cod'] as String,
      mensagemSefaz: map['mensagemSefaz'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseAtivacao.fromJson(String source) => ResponseAtivacao.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResponseAtivacao(numeroSessao: $numeroSessao, codStatus: $codStatus, mensagem: $mensagem, cod: $cod, mensagemSefaz: $mensagemSefaz)';
  }

  @override
  bool operator ==(covariant ResponseAtivacao other) {
    if (identical(this, other)) return true;

    return other.numeroSessao == numeroSessao && other.codStatus == codStatus && other.mensagem == mensagem && other.cod == cod && other.mensagemSefaz == mensagemSefaz;
  }

  @override
  int get hashCode {
    return numeroSessao.hashCode ^ codStatus.hashCode ^ mensagem.hashCode ^ cod.hashCode ^ mensagemSefaz.hashCode;
  }
}
