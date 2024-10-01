import '../../domain/ports/inputs/user_service.dart';
class Usercontroller  {

  final UserService _userService;

  Usercontroller(this._userService);

  getUsers() {
    _userService.getAllUsers().then((value) => value.forEach(print));
    
    
    }

}
  
