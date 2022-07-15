import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResponseStatus {
  final String numeroSessao;
  final String codStatus;
  final String mensagem;
  final String cod;
  final String mensagemSefaz;
  final String nserieSat;
  final String tipoLan;
  final String lanIp;
  final String lanMac;
  final String lanMask;
  final String lanGateway;
  final String lanDns;
  final String lanDns2;
  final String statusLan;
  final String nivelBateria;
  final String memoriaTotal;
  final String memoriaUsada;
  final String dataAtual;
  final String versaoSoftwareSat;
  final String versaoLayout;
  final String ultimoCfe;
  final String numeroInicial;
  final String numeroFinal;
  final String dataUltimaCfe;
  final String dataComunicacaoSefaz;
  final String dataEmissaoCertificado;
  final String dataVencimentoCertificado;
  final String estadoSat;
  ResponseStatus({
    required this.numeroSessao,
    required this.codStatus,
    required this.mensagem,
    required this.cod,
    required this.mensagemSefaz,
    required this.nserieSat,
    required this.tipoLan,
    required this.lanIp,
    required this.lanMac,
    required this.lanMask,
    required this.lanGateway,
    required this.lanDns,
    required this.lanDns2,
    required this.statusLan,
    required this.nivelBateria,
    required this.memoriaTotal,
    required this.memoriaUsada,
    required this.dataAtual,
    required this.versaoSoftwareSat,
    required this.versaoLayout,
    required this.ultimoCfe,
    required this.numeroInicial,
    required this.numeroFinal,
    required this.dataUltimaCfe,
    required this.dataComunicacaoSefaz,
    required this.dataEmissaoCertificado,
    required this.dataVencimentoCertificado,
    required this.estadoSat,
  });

  factory ResponseStatus.fromSat(List<String?> consulta) {
    final consultaMap = consulta.asMap();
    final status = ResponseStatus(
      numeroSessao: consulta[0] ?? '',
      codStatus: consulta[1] ?? '',
      mensagem: consulta[2] ?? '',
      cod: consulta[3] ?? '',
      mensagemSefaz: consultaMap.containsKey(4) ? consulta[4]! : '',
      nserieSat: consultaMap.containsKey(5) ? consulta[5]! : '',
      tipoLan: consultaMap.containsKey(6) ? consulta[6]! : '',
      lanIp: consultaMap.containsKey(7) ? consulta[7]! : '',
      lanMac: consultaMap.containsKey(8) ? consulta[8]! : '',
      lanMask: consultaMap.containsKey(9) ? consulta[9]! : '',
      lanGateway: consultaMap.containsKey(10) ? consulta[10]! : '',
      lanDns: consultaMap.containsKey(11) ? consulta[11]! : '',
      lanDns2: consultaMap.containsKey(12) ? consulta[12]! : '',
      statusLan: consultaMap.containsKey(13) ? consulta[13]! : '',
      nivelBateria: consultaMap.containsKey(14) ? consulta[14]! : '',
      memoriaTotal: consultaMap.containsKey(15) ? consulta[15]! : '',
      memoriaUsada: consultaMap.containsKey(16) ? consulta[16]! : '',
      dataAtual: consultaMap.containsKey(17) ? consulta[17]! : '',
      versaoSoftwareSat: consultaMap.containsKey(18) ? consulta[18]! : '',
      versaoLayout: consultaMap.containsKey(19) ? consulta[19]! : '',
      ultimoCfe: consultaMap.containsKey(20) ? consulta[20]! : '',
      numeroInicial: consultaMap.containsKey(21) ? consulta[21]! : '',
      numeroFinal: consultaMap.containsKey(22) ? consulta[22]! : '',
      dataUltimaCfe: consultaMap.containsKey(23) ? consulta[23]! : '',
      dataComunicacaoSefaz: consultaMap.containsKey(24) ? consulta[24]! : '',
      dataEmissaoCertificado: consultaMap.containsKey(25) ? consulta[25]! : '',
      dataVencimentoCertificado: consultaMap.containsKey(26) ? consulta[26]! : '',
      estadoSat: consultaMap.containsKey(27) ? consulta[27]! : '',
    );

    return status;
  }

  ResponseStatus copyWith({
    String? numeroSessao,
    String? codStatus,
    String? mensagem,
    String? cod,
    String? mensagemSefaz,
    String? nserieSat,
    String? tipoLan,
    String? lanIp,
    String? lanMac,
    String? lanMask,
    String? lanGateway,
    String? lanDns,
    String? lanDns2,
    String? statusLan,
    String? nivelBateria,
    String? memoriaTotal,
    String? memoriaUsada,
    String? dataAtual,
    String? versaoSoftwareSat,
    String? versaoLayout,
    String? ultimoCfe,
    String? numeroInicial,
    String? numeroFinal,
    String? dataUltimaCfe,
    String? dataComunicacaoSefaz,
    String? dataEmissaoCertificado,
    String? dataVencimentoCertificado,
    String? estadoSat,
  }) {
    return ResponseStatus(
      numeroSessao: numeroSessao ?? this.numeroSessao,
      codStatus: codStatus ?? this.codStatus,
      mensagem: mensagem ?? this.mensagem,
      cod: cod ?? this.cod,
      mensagemSefaz: mensagemSefaz ?? this.mensagemSefaz,
      nserieSat: nserieSat ?? this.nserieSat,
      tipoLan: tipoLan ?? this.tipoLan,
      lanIp: lanIp ?? this.lanIp,
      lanMac: lanMac ?? this.lanMac,
      lanMask: lanMask ?? this.lanMask,
      lanGateway: lanGateway ?? this.lanGateway,
      lanDns: lanDns ?? this.lanDns,
      lanDns2: lanDns2 ?? this.lanDns2,
      statusLan: statusLan ?? this.statusLan,
      nivelBateria: nivelBateria ?? this.nivelBateria,
      memoriaTotal: memoriaTotal ?? this.memoriaTotal,
      memoriaUsada: memoriaUsada ?? this.memoriaUsada,
      dataAtual: dataAtual ?? this.dataAtual,
      versaoSoftwareSat: versaoSoftwareSat ?? this.versaoSoftwareSat,
      versaoLayout: versaoLayout ?? this.versaoLayout,
      ultimoCfe: ultimoCfe ?? this.ultimoCfe,
      numeroInicial: numeroInicial ?? this.numeroInicial,
      numeroFinal: numeroFinal ?? this.numeroFinal,
      dataUltimaCfe: dataUltimaCfe ?? this.dataUltimaCfe,
      dataComunicacaoSefaz: dataComunicacaoSefaz ?? this.dataComunicacaoSefaz,
      dataEmissaoCertificado: dataEmissaoCertificado ?? this.dataEmissaoCertificado,
      dataVencimentoCertificado: dataVencimentoCertificado ?? this.dataVencimentoCertificado,
      estadoSat: estadoSat ?? this.estadoSat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numeroSessao': numeroSessao,
      'codStatus': codStatus,
      'mensagem': mensagem,
      'cod': cod,
      'mensagemSefaz': mensagemSefaz,
      'nserieSat': nserieSat,
      'tipoLan': tipoLan,
      'lanIp': lanIp,
      'lanMac': lanMac,
      'lanMask': lanMask,
      'lanGateway': lanGateway,
      'lanDns': lanDns,
      'lanDns2': lanDns2,
      'statusLan': statusLan,
      'nivelBateria': nivelBateria,
      'memoriaTotal': memoriaTotal,
      'memoriaUsada': memoriaUsada,
      'dataAtual': dataAtual,
      'versaoSoftwareSat': versaoSoftwareSat,
      'versaoLayout': versaoLayout,
      'ultimoCfe': ultimoCfe,
      'numeroInicial': numeroInicial,
      'numeroFinal': numeroFinal,
      'dataUltimaCfe': dataUltimaCfe,
      'dataComunicacaoSefaz': dataComunicacaoSefaz,
      'dataEmissaoCertificado': dataEmissaoCertificado,
      'dataVencimentoCertificado': dataVencimentoCertificado,
      'estadoSat': estadoSat,
    };
  }

  factory ResponseStatus.fromMap(Map<String, dynamic> map) {
    return ResponseStatus(
      numeroSessao: map['numeroSessao'] as String,
      codStatus: map['codStatus'] as String,
      mensagem: map['mensagem'] as String,
      cod: map['cod'] as String,
      mensagemSefaz: map['mensagemSefaz'] as String,
      nserieSat: map['nserieSat'] as String,
      tipoLan: map['tipoLan'] as String,
      lanIp: map['lanIp'] as String,
      lanMac: map['lanMac'] as String,
      lanMask: map['lanMask'] as String,
      lanGateway: map['lanGateway'] as String,
      lanDns: map['lanDns'] as String,
      lanDns2: map['lanDns2'] as String,
      statusLan: map['statusLan'] as String,
      nivelBateria: map['nivelBateria'] as String,
      memoriaTotal: map['memoriaTotal'] as String,
      memoriaUsada: map['memoriaUsada'] as String,
      dataAtual: map['dataAtual'] as String,
      versaoSoftwareSat: map['versaoSoftwareSat'] as String,
      versaoLayout: map['versaoLayout'] as String,
      ultimoCfe: map['ultimoCfe'] as String,
      numeroInicial: map['numeroInicial'] as String,
      numeroFinal: map['numeroFinal'] as String,
      dataUltimaCfe: map['dataUltimaCfe'] as String,
      dataComunicacaoSefaz: map['dataComunicacaoSefaz'] as String,
      dataEmissaoCertificado: map['dataEmissaoCertificado'] as String,
      dataVencimentoCertificado: map['dataVencimentoCertificado'] as String,
      estadoSat: map['estadoSat'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseStatus.fromJson(String source) => ResponseStatus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResponseStatus(numeroSessao: $numeroSessao, codStatus: $codStatus, mensagem: $mensagem, cod: $cod, mensagemSefaz: $mensagemSefaz, nserieSat: $nserieSat, tipoLan: $tipoLan, lanIp: $lanIp, lanMac: $lanMac, lanMask: $lanMask, lanGateway: $lanGateway, lanDns: $lanDns, lanDns2: $lanDns2, statusLan: $statusLan, nivelBateria: $nivelBateria, memoriaTotal: $memoriaTotal, memoriaUsada: $memoriaUsada, dataAtual: $dataAtual, versaoSoftwareSat: $versaoSoftwareSat, versaoLayout: $versaoLayout, ultimoCfe: $ultimoCfe, numeroInicial: $numeroInicial, numeroFinal: $numeroFinal, dataUltimaCfe: $dataUltimaCfe, dataComunicacaoSefaz: $dataComunicacaoSefaz, dataEmissaoCertificado: $dataEmissaoCertificado, dataVencimentoCertificado: $dataVencimentoCertificado, estadoSat: $estadoSat)';
  }

  @override
  bool operator ==(covariant ResponseStatus other) {
    if (identical(this, other)) return true;

    return other.numeroSessao == numeroSessao &&
        other.codStatus == codStatus &&
        other.mensagem == mensagem &&
        other.cod == cod &&
        other.mensagemSefaz == mensagemSefaz &&
        other.nserieSat == nserieSat &&
        other.tipoLan == tipoLan &&
        other.lanIp == lanIp &&
        other.lanMac == lanMac &&
        other.lanMask == lanMask &&
        other.lanGateway == lanGateway &&
        other.lanDns == lanDns &&
        other.lanDns2 == lanDns2 &&
        other.statusLan == statusLan &&
        other.nivelBateria == nivelBateria &&
        other.memoriaTotal == memoriaTotal &&
        other.memoriaUsada == memoriaUsada &&
        other.dataAtual == dataAtual &&
        other.versaoSoftwareSat == versaoSoftwareSat &&
        other.versaoLayout == versaoLayout &&
        other.ultimoCfe == ultimoCfe &&
        other.numeroInicial == numeroInicial &&
        other.numeroFinal == numeroFinal &&
        other.dataUltimaCfe == dataUltimaCfe &&
        other.dataComunicacaoSefaz == dataComunicacaoSefaz &&
        other.dataEmissaoCertificado == dataEmissaoCertificado &&
        other.dataVencimentoCertificado == dataVencimentoCertificado &&
        other.estadoSat == estadoSat;
  }

  @override
  int get hashCode {
    return numeroSessao.hashCode ^ codStatus.hashCode ^ mensagem.hashCode ^ cod.hashCode ^ mensagemSefaz.hashCode ^ nserieSat.hashCode ^ tipoLan.hashCode ^ lanIp.hashCode ^ lanMac.hashCode ^ lanMask.hashCode ^ lanGateway.hashCode ^ lanDns.hashCode ^ lanDns2.hashCode ^ statusLan.hashCode ^ nivelBateria.hashCode ^ memoriaTotal.hashCode ^ memoriaUsada.hashCode ^ dataAtual.hashCode ^ versaoSoftwareSat.hashCode ^ versaoLayout.hashCode ^ ultimoCfe.hashCode ^ numeroInicial.hashCode ^ numeroFinal.hashCode ^ dataUltimaCfe.hashCode ^ dataComunicacaoSefaz.hashCode ^ dataEmissaoCertificado.hashCode ^ dataVencimentoCertificado.hashCode ^ estadoSat.hashCode;
  }
}
