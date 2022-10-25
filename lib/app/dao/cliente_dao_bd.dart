import 'package:eng3_cliente/app/dao/interface/i_dao.dart';
import 'package:eng3_cliente/app/domain_models/supper_class/entidade_dominio.dart';

class ClienteDaoBD implements IDao {
  @override
  void salvar({required EntidadeDominio entidadeDominio}) {}
  @override
  void consultar({required EntidadeDominio entidadeDominio}) {}

  @override
  void alterar({required EntidadeDominio entidadeDominio}) {}

  @override
  void excluir({required int id}) {}
}
