import 'package:eng3_cliente/app/domain_models/supper_class/entidade_dominio.dart';

abstract class IDao {
  void salvar({required EntidadeDominio entidadeDominio});
  void consultar({required EntidadeDominio entidadeDominio});
  void alterar({required EntidadeDominio entidadeDominio});
  void excluir({required int id});
}
