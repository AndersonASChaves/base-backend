import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../core/web/controller.dart';
import '../../domain/ports/inputs/user_service.dart';
import '../dtos/user_dto.dart';
import '../../domain/models/user.dart';

class Usercontroller extends Controller {

  final UserService _userService;
  Usercontroller(this._userService);
@override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    final Router router = Router();


    router.get('/users', (Request res) async {
      // logica da api
      List<User> users = await _userService.getAllUsers(); //Criar um Json
      List<Map>  usersMap = 
                users.map((User user) => UserDto.toMap(user)).toList();
        return Response.ok(
        jsonEncode(usersMap),
        headers: {'content-type' : 'application/json'},
       );
    });

    return createHandler(
      router: router.call,
      isSecurity: isSecurity,
      middlewares: middlewares,
      );
  }

}
  
