import 'database.dart';

import 'package:mysql1/mysql1.dart';

class DatabaseMySqlAdpter implements Database{
  @override
  // TODO: implement getConnection
  Future<MySqlConnection> get getConnection => MySqlConnection.connect(
    ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      db: 'delivery',
      password: 'root',
      )
    );

  @override
  query(String sql, [List? params]) async {
    var conn = await getConnection;
    return conn.query(sql, params);
  }

}