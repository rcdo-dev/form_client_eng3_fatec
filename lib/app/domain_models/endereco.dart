import 'package:eng3_cliente/app/domain_models/cidade.dart';

class Endereco {
  String? logradouro;
  String? cep;
  String? complemento;
  Cidade? cidade;

  Endereco({
    this.logradouro,
    this.complemento,
    this.cep,
    this.cidade,
  });

  void validarEndereco() {}
}
