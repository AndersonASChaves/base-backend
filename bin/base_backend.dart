import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:commons_core/commons_core.dart';
import 'core/database/database_mysql_adpter.dart';
void main(List<String> arguments) async{

  var result = await CustomEnv.get<String>(key: 'chave');

  var result1 = await CustomEnv.get<String>(key: 'host');
  print(result1);
  print(result);
  print(await DatabaseMySqlAdpter().query('select * from tb_permissoes'));
 
  //await DatabaseMySqlAdpter().query("insert into tb_permissoes(nome, status) values ('ADMIN', 'A')") ;
  //await serve(
  //    (Request req) => Response(200,
  //      body: 'Olá Mundo', headers: {'content-type': 'application/json'}),
  //    'localhost',
  //    8080,
  //  ); 
}
