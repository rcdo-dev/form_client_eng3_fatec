import 'package:eng3_cliente/app/dao/app_file/cliente_dao_app_file.dart';
import 'package:eng3_cliente/app/domain_models/dependente.dart';
import 'package:eng3_cliente/app/domain_models/endereco.dart';

import 'supper_class/pessoa.dart';

class Cliente extends Pessoa {
  double? credito;
  String? cpf;
  Endereco? endereco;
  Dependente? dependenteUm;
  Dependente? dependenteDois;

  Cliente({
    this.credito,
    this.cpf,
    this.endereco,
    this.dependenteUm,
    this.dependenteDois,
    String? nome,
  }) : super(nome: nome);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'credito': credito,
      'cpf': cpf,
      'endereco': endereco,
      'dependentes': dependenteUm,
    };
  }

  @override
  String toString() {
    return 'Cliente{id: $id, nome: $nome, credito: $credito, cpf: $cpf, endereco: $endereco, dependentes: $dependenteUm}';
  }

  void validarNumeroDependentes() {}

  // Method ok.
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

  void salvar({required Cliente cliente}) {
    // ClienteDaoSqflite dao = ClienteDaoSqflite();
    // dao.salvar(entidadeDominio: cliente);

    ClienteDaoAppFile dao = ClienteDaoAppFile();
    dao.salvar(entidadeDominio: cliente);
  }
}
