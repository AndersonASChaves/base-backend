import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../core/web/controller.dart';
import '../../domain/ports/inputs/user_service.dart';


class Usercontroller extends Controller {

  final UserService _userService;
  Usercontroller(this._userService);
@override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    final Router router = Router();


    router.get('/users', (Request res){
      // logica da api
       return Response(200);
    });

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
      );
  }

}
  
