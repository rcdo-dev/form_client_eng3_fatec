import 'package:eng3_cliente/app/domain_models/dependente.dart';
import 'package:eng3_cliente/app/domain_models/endereco.dart';
import 'package:eng3_cliente/app/domain_models/parentesco.dart';

import 'pessoa.dart';

class Cliente extends Pessoa {
  double? credito;
  String? cpf;
  Endereco? endereco;
  List<Dependente>? dependentes = [];

  Cliente({
    this.credito,
    this.cpf,
    this.endereco,
    this.dependentes,
    String? nome,
  }) : super(nome: nome);

  void validarNumeroDependentes({
    required Dependente dependente,
    required Parentesco parentesco,
    List<Dependente>? list,
  }) {
    if (list != null) {
      if (list.isEmpty) {
        if (dependente.validarParentesco(parentesco)) {
          list.add(dependente);
        }
      } else if (list.length < 2) {
        if (dependente.validarParentesco(parentesco)) {
          list.add(dependente);
        }
      } else {
        print('Número máximo de dependentes atingido!');
      }
    } else {
      throw Exception('Lista com valor nulo!');
    }
    print(list);
  }

  bool validarDadosObrigatorios({required bool validate}) {
    if (validate) {
      return true;
    }
    return false;
  }

  void validarCpf() {}

  void validarExistencia() {}

  void validarCredito() {}

  void complementarDataCadastro() {}

  void salvar() {}
}
