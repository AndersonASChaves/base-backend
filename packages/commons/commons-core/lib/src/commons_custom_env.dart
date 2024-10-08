import 'dart:io';
class CustomEnv {
  static Map<String, String> _map = {};
  static String _file = '.env';

  CustomEnv._();

  factory CustomEnv.fromFile(String file) {
    _file = file;
    return CustomEnv._();
  }

  static Future<T> get<T>({required String key}) async {
    if (_map.isEmpty) await _load();
    return _map[key]!.toType(T);
  }
   static Future<void> _load() async {
    List<String> linhas = (await _readFile()).split('\n')
    ..removeWhere((e) => e.isEmpty);
    _map = {for (var l in linhas) l.split('=')[0]: l.split('=')[1]};
  }
   static Future<String> _readFile() async {
    return await File(_file).readAsString();
  }

}

extension ParserExtension on String{
  toType(Type type){
    switch (type){
      case String:
        return toString();
      case int:
        return int.parse(toString());
      default:
        return toString();
    }
  }

}