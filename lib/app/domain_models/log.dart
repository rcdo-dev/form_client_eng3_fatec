import 'package:eng3_cliente/app/domain_models/cliente.dart';

class Log {
  final String? descricao;
  final DateTime? date;

  Log({
    this.descricao,
    this.date,
  });

  void gerarLog({required Cliente cliente}) {}
}
