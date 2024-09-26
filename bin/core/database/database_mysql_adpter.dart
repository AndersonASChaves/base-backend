import 'database.dart';
import 'package:mysql1/mysql1.dart';
import 'package:commons_core/commons_core.dart';



class DatabaseMySqlAdpter implements Database{
  @override
    Future<MySqlConnection> get getConnection async => await MySqlConnection.connect(
       ConnectionSettings(
          host: 'localhost', //await CustomEnv.get<String>(key: 'user'), //Desacoplamento gerendo erro
          port: 3306, //await CustomEnv.get<int>(key: 'port'),
          user: 'root', //await CustomEnv.get<String>(key: 'user'),
          db: 'delivery', //await CustomEnv.get<String>(key: 'db'),
          password: 'root', //await CustomEnv.get<String>(key: 'password'),
        ),
      );  
 
    @override
   query(String sql, [List? params]) async {
      var conn = await getConnection;
      return conn.query(sql, params);
    }

}