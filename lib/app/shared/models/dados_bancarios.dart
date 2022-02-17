class DadosBancarios {
  late final String? banco;
  late final String? agencia;
  late final String? tipoConta;
  late final String? operacao;
  late final String? numeroDaConta;
  DadosBancarios({
    required this.banco,
    required this.agencia,
    required this.tipoConta,
    this.operacao,
    required this.numeroDaConta,
  });

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['banco'] = banco;
    _data['agencia'] = agencia;
    _data['tipoConta'] = tipoConta;
    _data['operacao'] = operacao;
    _data['numeroDaConta'] = numeroDaConta;
    return _data;
  }

  DadosBancarios.fromJson(Map<String, dynamic> json) {
    banco = json['banco'] == null ? '' : json['banco'] as String?;
    agencia = json['agencia'] == null ? '' : json['agencia'] as String?;
    tipoConta = json['tipoConta'] == null ? '' : json['tipoConta'] as String?;
    operacao = json['operacao'] == null ? '' : json['operacao'] as String?;
    numeroDaConta =
        json['numeroDaConta'] == null ? '' : json['numeroDaConta'] as String?;
  }
}
