import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResponseNota {
  final String numeroSessao;
  final String codStatus;
  final String codAlerta;
  final String mensagem;
  final String cod;
  final String mensagemSefaz;
  final String xmlBase64;
  final String timeStamp;
  final String chave;
  final String valorTotal;
  final String dadosCnpj;
  final String assinaturaQrcode;
  ResponseNota({
    required this.numeroSessao,
    required this.codStatus,
    required this.codAlerta,
    required this.mensagem,
    required this.cod,
    required this.mensagemSefaz,
    required this.xmlBase64,
    required this.timeStamp,
    required this.chave,
    required this.valorTotal,
    required this.dadosCnpj,
    required this.assinaturaQrcode,
  });

  ResponseNota copyWith({String? numeroSessao, String? codStatus, String? mensagem, String? cod, String? mensagemSefaz, String? xmlBase64, String? timeStamp, String? chave, String? valorTotal, String? dadosCnpj, String? assinaturaQrcode, String? codAlerta}) {
    return ResponseNota(
      numeroSessao: numeroSessao ?? this.numeroSessao,
      codStatus: codStatus ?? this.codStatus,
      mensagem: mensagem ?? this.mensagem,
      cod: cod ?? this.cod,
      mensagemSefaz: mensagemSefaz ?? this.mensagemSefaz,
      xmlBase64: xmlBase64 ?? this.xmlBase64,
      timeStamp: timeStamp ?? this.timeStamp,
      chave: chave ?? this.chave,
      valorTotal: valorTotal ?? this.valorTotal,
      dadosCnpj: dadosCnpj ?? this.dadosCnpj,
      codAlerta: codAlerta ?? this.codAlerta,
      assinaturaQrcode: assinaturaQrcode ?? this.assinaturaQrcode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numeroSessao': numeroSessao,
      'codStatus': codStatus,
      'mensagem': mensagem,
      'cod': cod,
      'mensagemSefaz': mensagemSefaz,
      'xmlBase64': xmlBase64,
      'timeStamp': timeStamp,
      'chave': chave,
      'valorTotal': valorTotal,
      'dadosCnpj': dadosCnpj,
      'assinaturaQrcode': assinaturaQrcode,
    };
  }

  factory ResponseNota.fromMap(Map<String, dynamic> map) {
    return ResponseNota(
      numeroSessao: map['numeroSessao'] as String,
      codStatus: map['codStatus'] as String,
      mensagem: map['mensagem'] as String,
      cod: map['cod'] as String,
      mensagemSefaz: map['mensagemSefaz'] as String,
      xmlBase64: map['xmlBase64'] as String,
      timeStamp: map['timeStamp'] as String,
      chave: map['chave'] as String,
      valorTotal: map['valorTotal'] as String,
      dadosCnpj: map['dadosCnpj'] as String,
      assinaturaQrcode: map['assinaturaQrcode'] as String,
      codAlerta: map['codAlerta'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseNota.fromJson(String source) => ResponseNota.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResponseNota(numeroSessao: $numeroSessao, codStatus: $codStatus, mensagem: $mensagem, cod: $cod, mensagemSefaz: $mensagemSefaz, xmlBase64: $xmlBase64, timeStamp: $timeStamp, chave: $chave, valorTotal: $valorTotal, dadosCnpj: $dadosCnpj, assinaturaQrcode: $assinaturaQrcode)';
  }

  @override
  bool operator ==(covariant ResponseNota other) {
    if (identical(this, other)) return true;

    return other.numeroSessao == numeroSessao && other.codStatus == codStatus && other.mensagem == mensagem && other.cod == cod && other.mensagemSefaz == mensagemSefaz && other.xmlBase64 == xmlBase64 && other.timeStamp == timeStamp && other.chave == chave && other.valorTotal == valorTotal && other.dadosCnpj == dadosCnpj && other.assinaturaQrcode == assinaturaQrcode;
  }

  @override
  int get hashCode {
    return numeroSessao.hashCode ^ codStatus.hashCode ^ mensagem.hashCode ^ cod.hashCode ^ mensagemSefaz.hashCode ^ xmlBase64.hashCode ^ timeStamp.hashCode ^ chave.hashCode ^ valorTotal.hashCode ^ dadosCnpj.hashCode ^ assinaturaQrcode.hashCode;
  }

  factory ResponseNota.fromSat(List<String?> consulta) {
    final consultaMap = consulta.asMap();
    final status = ResponseNota(
      numeroSessao: consulta[0] ?? '',
      codStatus: consulta[1] ?? '',
      codAlerta: consulta[2] ?? '',
      mensagem: consulta[3] ?? '',
      cod: consulta[4] ?? '',
      mensagemSefaz: consulta[5] ?? '',
      xmlBase64: consultaMap.containsKey(6) ? consulta[6]! : '',
      timeStamp: consultaMap.containsKey(7) ? consulta[7]! : '',
      chave: consultaMap.containsKey(8) ? consulta[8]! : '',
      valorTotal: consultaMap.containsKey(9) ? consulta[9]! : '',
      dadosCnpj: consultaMap.containsKey(10) ? consulta[10]! : '',
      assinaturaQrcode: consultaMap.containsKey(11) ? consulta[11]! : '',
    );

    return status;
  }
}
