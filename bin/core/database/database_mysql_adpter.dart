
import 'dart:async';

import 'package:commons_core/commons_core.dart';
import 'database.dart';
import 'package:mysql1/mysql1.dart';
class DatabaseMySqlAdpter implements Database{
  @override
    Future<MySqlConnection> get getConnection async => await MySqlConnection.connect(
       ConnectionSettings(
          host:  (await CustomEnv.get<String>(key: 'host')).replaceAll('\r', ''), //\r é reconhecido ao ler arquivo. Removido por metodo replaceAll.
          port: (await CustomEnv.get<int>(key: 'port')), //await CustomEnv.get<int>(key: 'port'),
          user: (await CustomEnv.get<String>(key: 'user')).replaceAll('\r', ''), //await CustomEnv.get<String>(key: 'user'),
          db: (await CustomEnv.get<String>(key: 'db')).replaceAll('\r', ''), //await CustomEnv.get<String>(key: 'db'),
          password: (await CustomEnv.get<String>(key: 'password')).replaceAll('\r', ''), //await CustomEnv.get<String>(key: 'password'),
        ),
      );  
 
    @override

    query(String sql, [List? params]) async {
      var conn = await getConnection;
      return conn.query(sql, params);
    }
}