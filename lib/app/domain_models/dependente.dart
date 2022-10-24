import 'package:eng3_cliente/app/domain_models/parentesco.dart';

import 'pessoa.dart';

class Dependente extends Pessoa {
  final Parentesco? parentesco;

  Dependente({
    this.parentesco,
    String? nome,
  }) : super(nome: nome);

  bool validarParentesco(Parentesco parentesco) {
    var descricao = parentesco.tipoParentesco;
    if (descricao == 'conjuge' || descricao == 'filho' || descricao == 'filha') {
      return true;
    }
    return false;
  }
}
