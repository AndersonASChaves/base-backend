import '../../domain/models/user.dart';
import '../../domain/ports/outputs/user_repository.dart';
import '../../core/database/database.dart';

class UserRepositoryImp implements UserRepository {

  final Database _database;
  UserRepositoryImp(this._database);

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
    final String _query = '''
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
   var result = await _database.query(_query);
   return [];
  }

  @override
  bool saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}