import 'package:eng3_cliente/app/dao/interface/i_dao.dart';
import 'package:eng3_cliente/app/dao/sqflite/database.dart';
import 'package:eng3_cliente/app/domain_models/supper_class/entidade_dominio.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain_models/cliente.dart';

class ClienteDaoSqflite implements IDao {
  static const String _tableName = 'clientes';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _credito = 'credito';
  static const String _cpf = 'cpf';
  static const String _endereco = 'endereco';
  static const String _dependenteUm = 'dependenteUm';
  static const String _dependenteDois = 'dependenteDois';

  static const String createTable = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_nome TEXT, '
      '$_credito DOUBLE, '
      '$_cpf TEXT, '
      '$_endereco TEXT, '
      '$_dependenteUm TEXT, '
      '$_dependenteDois TEXT'
      ')';

  @override
  Future<int> salvar({required EntidadeDominio entidadeDominio}) async {
    var cliente = entidadeDominio as Cliente;
    final Database database = await getDatabase();

    return database.insert(_tableName, cliente.toMap());
  }

  @override
  void consultar({required EntidadeDominio entidadeDominio}) {}

  @override
  void alterar({required EntidadeDominio entidadeDominio}) {}

  @override
  void excluir({required int id}) {}
}
