import 'categoria.dart';
import 'estabelecimento.dart';

class Produto {
final String nome;
final String descricao; //na aula esta descrico
final double valor;
final String status;
final Estabelecimento estabelecimento;
final Categoria categoria;
final int? id;

  Produto( 
    this.nome,
    this.descricao,
    this.valor,
    this.status,
    this.estabelecimento,
    this.categoria,
    [this.id,]
    );

}