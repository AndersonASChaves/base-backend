
import 'dart:async';

import 'package:commons_core/commons_core.dart';
import 'database.dart';
import 'package:mysql1/mysql1.dart';
class DatabaseMySqlAdpter implements Database{


//Future gethost() async {
//  var _hostenv = await CustomEnv.get<String>(key: 'host');
//}

  @override
    Future<MySqlConnection> get getConnection async => MySqlConnection.connect(
       ConnectionSettings(
          host:  await CustomEnv.get<String>(key: 'host'), //Desacoplamento gerendo erro
          port: 3306, //await CustomEnv.get<int>(key: 'port'),
          user: 'root', //await CustomEnv.get<String>(key: 'user'),
          db: 'delivery', //await CustomEnv.get<String>(key: 'db'),
          password: 'root', //await CustomEnv.get<String>(key: 'password'),
        ),
      );  
 
    @override

    query(String sql, [List? params]) async {
      String h = await CustomEnv.get<String>(key: 'host');
      var conn = await MySqlConnection.connect(
       ConnectionSettings(
          host:  h, //Desacoplamento gerendo erro
          port: 3306, //await CustomEnv.get<int>(key: 'port'),
          user: 'root', //await CustomEnv.get<String>(key: 'user'),
          db: 'delivery', //await CustomEnv.get<String>(key: 'db'),
          password: 'root',),);
      return conn.query(sql, params);
    }
  /* query(String sql, [List? params]) async {
      var conn = await getConnection;
      return conn.query(sql, params);
    }*/

}