import 'package:commons_core/commons_core.dart';
//Web
import '../application/web/categoria_controller.dart';
import '../application/web/estabelecimento_controller.dart';
import '../application/web/produto_controller.dart';
import '../application/web/user_controller.dart';
//Domain Ports Inputs
import '../domain/ports/inputs/categoria_service.dart';
import '../domain/ports/inputs/estabelecimento_service.dart';
import '../domain/ports/inputs/produto_service.dart';
import '../domain/ports/inputs/user_service.dart';
//Domain Ports Outputs
import '../domain/ports/outputs/categoria_repository.dart';
import '../domain/ports/outputs/estabelecimento_repository.dart';
import '../domain/ports/outputs/produto_repository.dart';
import '../domain/ports/outputs/user_repository.dart';
//Domain Services
import '../domain/services/categoria_service_imp.dart';
import '../domain/services/estabelecimento_service_imp.dart';
import '../domain/services/produto_service_imp.dart';
import '../domain/services/user_service_imp.dart';
//Infraestructure Database
import '../infrastructure/database/categoria_repository_imp.dart';
import '../infrastructure/database/estabelecimento_repositor_imp.dart';
import '../infrastructure/database/produto_repository_imp.dart';
import '../infrastructure/database/user_repository_imp.dart';
//Infraestructure Mappers
import '../infrastructure/mappers/categoria_mapper.dart';
import '../infrastructure/mappers/estabelecimento_mapper.dart';
import '../infrastructure/mappers/produto_mapper.dart';
import '../infrastructure/mappers/user_mapper.dart';
//Database
import 'database/database.dart';
import 'database/database_mysql_adpter.dart';

class Injections {
  static DependencyInjector init() {
    var di = DependencyInjector();

    di.register<Database>(()=>DatabaseMySqlAdpter());

    //user
    di.register<UserRepository>(() => UserRepositoryImp(di<Database>(), UserMapper()));
    di.register<UserService>(() => UserServiceImp(di<UserRepository>()));
    di.register<UserController>(() => UserController(di<UserService>()));

    //Estabelecimento
    di.register<EstabelecimentoRepository>(() => EstabelecimentoRepositorImp(di<Database>(), EstabelecimentoMapper()));
    di.register<EstabelecimentoService>(() => EstabelecimentoServiceImp(di<EstabelecimentoRepository>()));
    di.register<EstabelecimentoController>(() => EstabelecimentoController(di<EstabelecimentoService>()));


    //Categoria
    di.register<CategoriaRepository>(() => CategoriaRepositoryImp(di<Database>(), CategoriaMapper()));
    di.register<CategoriaService>(() => CategoriaServiceImp(di<CategoriaRepository>()));
    di.register<CategoriaController>(() => CategoriaController(di<CategoriaService>()));

     //Produto
    di.register<ProdutoRepository>(() => ProdutoRepositoryImp(di<Database>(), ProdutoMapper()));
    di.register<ProdutoService>(() => ProdutoServiceImp(di<ProdutoRepository>()));
    di.register<produtoController>(() => produtoController(di<ProdutoService>()));
    
    return di;
        

  }

}