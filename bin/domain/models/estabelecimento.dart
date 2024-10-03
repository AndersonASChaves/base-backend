import 'user.dart';

class Estabelecimento{
  final String nome;
  final String cnpj;
  final String telefone;
  final String descricao;
  final String imagemUrl;
  final String latitude;
  final String longitude;
  final String endereco;
  final String enderecoNumero;
  final String? enderecoOpcional;
  final String status;
  final User proprietario;

  Estabelecimento( 
    this.nome,
    this.cnpj,
    this.telefone,
    this.descricao,
    this.imagemUrl,
    this.latitude,
    this.longitude,
    this.endereco,
    this.enderecoNumero,
    this.enderecoOpcional,
    this.status,
    this.proprietario);

}