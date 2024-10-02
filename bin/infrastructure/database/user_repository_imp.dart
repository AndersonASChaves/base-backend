import '../../domain/models/user.dart';
import '../../domain/ports/outputs/user_repository.dart';
import '../../core/database/database.dart';
import '../../core/database/mapper.dart';


class UserRepositoryImp implements UserRepository {

  final Mapper _mapper;
  final Database _database;
  UserRepositoryImp(this._database, this._mapper);

  @override
  User getUserByEmail(String email) {
    // TODO: implement getUserByEmail
    throw UnimplementedError();
  }

  @override
  User getUserById(int id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() async {
    final String query = '''
              SELECT
                id,
                  nome,
                  sobrenome,
                  dataNasc,
                  documento,
                  email,
                  cidade,
                  status
              FROM tb_usuarios;
''';
   var result = await _database.query(query);
   
   List<User> users =    
          result.map((row) => _mapper.toDomain(row.fields)).toList().cast<User>(); 
              
   return users;
  }

  @override
  bool saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}