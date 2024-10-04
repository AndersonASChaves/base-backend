import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io ;
import 'package:commons_core/commons_core.dart';
import 'dart:async';


import 'core/database/database.dart';
import 'core/database/database_mysql_adpter.dart';
import 'domain/ports/inputs/user_service.dart';
import 'domain/services/user_service_imp.dart';
import 'domain/ports/outputs/user_repository.dart';
import 'infrastructure/database/user_repository_imp.dart';


import 'core/database/mapper.dart';
import 'infrastructure/mappers/user_mapper.dart';
import 'application/dtos/user_dto.dart';


import 'application/web/user_controller.dart';
import 'application/web/estabelecimento_controller.dart';
import 'application/web/categoria_controller.dart';
import 'application/web/produto_controller.dart';
import 'core/injections.dart';

void main(List<String> arguments) async{
  final i = Injections.init();

  var cascadeHandler = Cascade()
    .add(i<UserController>().getHandler())
    .add(i<EstabelecimentoController>().getHandler())
    .add(i<CategoriaController>().getHandler())
    .add(i<produtoController>().getHandler())
    .handler;

  //pipeline de execução
  var handler = 
       Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  shelf_io.serve(
    handler, 
    (await CustomEnv.get<String>(key: 'server_ip')).replaceAll('\r', ''),
     await CustomEnv.get<int>(key: 'server_port'),
    
    ).then(
      (s) => print(
        'Servidor inicializado http://${s.address.address}:${s.port}'),
    );
}



//Codigo de Testes no Inicio do Curso
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


//Teste 2
// final Mapper _userMapper = UserMapper();
//   final Database _database = DatabaseMySqlAdpter();
//   final UserRepository _userRepository = 
//         UserRepositoryImp(_database, _userMapper);
//   final UserService _userService = UserServiceImp(_userRepository);
//   final Usercontroller _userController = Usercontroller(_userService);

//   _userService
//   .saveUser(UserDto(
//      'Teste F',
//      'Ciclano',
//      DateTime.utc(1944, 6, 6),
//      'A',
//      'documento123',
//      'teste@ciclano.com',
//      'Curitiba',
//      'password123',
//      'token45245',     
//      ));

//   var cascadeHandler = Cascade().add(_userController.getHandler()).handler;
//   //pipeline de execução
//   var handler = Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  

//   shelf_io.serve(
//     handler, 
//     (await CustomEnv.get<String>(key: 'server_ip')).replaceAll('\r', ''),
//     await CustomEnv.get<int>(key: 'server_port'),
    
//     );