import 'dart:convert';
import 'dart:io';

import 'package:eng3_cliente/app/dao/app_file/file_creation.dart';
import 'package:eng3_cliente/app/dao/interface/i_dao.dart';
import 'package:eng3_cliente/app/domain_models/supper_class/entidade_dominio.dart';

import '../../domain_models/cliente.dart';

class ClienteDaoAppFile implements IDao {
  @override
  Future<void> salvar({required EntidadeDominio entidadeDominio}) async {
    var cliente = entidadeDominio as Cliente;

    FileCreation().createFile();

    final file = File('db.txt');

    await file.writeAsString(cliente.nome.toString(), encoding: const Utf8Codec());
    await file.writeAsString('\n${cliente.cpf.toString()}', mode: FileMode.append);
    await file.writeAsString('\n${cliente.credito.toString()}', mode: FileMode.append);
    await file.writeAsString('\n${cliente.endereco?.logradouro.toString()}', mode: FileMode.append);
    await file.writeAsString('\n${cliente.endereco?.cidade?.estado?.nome.toString()}', mode: FileMode.append);
  }

  @override
  void consultar({required EntidadeDominio entidadeDominio}) {}

  @override
  Future<void> alterar({required EntidadeDominio entidadeDominio}) async {}

  @override
  void excluir({required int id}) {}
}
