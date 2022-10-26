import 'package:eng3_cliente/app/dao/sqflite/cliente_dao_sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'client.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(
        ClienteDaoSqflite.createTable,
      );
    },
    version: 1,
  );
}
