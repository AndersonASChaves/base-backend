import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:commons_core/commons_core.dart';
import 'dart:async';

import 'application/web/UserController.dart';
import 'core/database/database.dart';
import 'core/database/database_mysql_adpter.dart';
import 'domain/ports/inputs/user_service.dart';
import 'domain/services/user_service_imp.dart';
import 'domain/ports/outputs/user_repository.dart';
import 'infrastructure/database/user_repository_imp.dart';


import 'core/database/mapper.dart';
import 'infrastructure/mappers/user_mapper.dart';

void main(List<String> arguments) async{

  //var result = await CustomEnv.get<String>(key: 'chave');

  //var result1 = await CustomEnv.get<String>(key: 'host');
  //print(result1);
  //print(result);
  //DatabaseMySqlAdpter().gethost() ;
 
  
  //print(await DatabaseMySqlAdpter().query('select * from tb_permissoes'));
 
  //await DatabaseMySqlAdpter().query("insert into tb_permissoes(nome, status) values ('ADMIN', 'A')") ;
  //await serve(
  //    (Request req) => Response(200,
  //      body: 'Olá Mundo', headers: {'content-type': 'application/json'}),
  //    'localhost',
  //    8080,
  //  ); 

  final Mapper _userMapper = UserMapper();
  final Database database = DatabaseMySqlAdpter();
  final UserRepository userRepository = 
        UserRepositoryImp(database, _userMapper);
  final UserService userService = UserServiceImp(userRepository);
  final Usercontroller userController = Usercontroller(userService);

  userController.getUsers();
}
