//Herança com construtores
class Localizacao {
  num lat, lon;

  Localizacao(this.lat, this.lon);

  //Construtor nomeado
  Localizacao.criar(this.lat, this.lon);


}

class Planalto extends Localizacao {
  num elevacao;

  Planalto(num lat, num lon, this.elevacao) : super.criar(lat, lon); //chamar construtor de Localizacao

  //sobrepor o toString();
@override
  String toString() {
     String resultado = "A elevacao do planalto e' ${this.elevacao} "
         "e latitude: ${this.lat} e longitude: ${this.lon}";
    return resultado;
  }
}


main(List<String> arguments) {
  var planalto = new Planalto(89.89, 134.12, 324);
  print(planalto);

  String nome = "Carlos";
  Object a = new Object();


//
//  print("A elevacao do planalto e' ${planalto.elevacao} "
//      "e latitude: ${planalto.lat} e longitude: ${planalto.lon}" );




}







//class Pessoa {
//   String nome, apelido;
//   String nacionalidade;
//   int idade;
//
//
//   void printeNome() {
//      print(this.nome);
//   }
//   void dizAlo() {
//      print("Hello");
//   }
//
//
//}
//
//class Jorge extends Pessoa {
//   String telefone;
//
//   void noTelefone() {
//      print(this.telefone);
//   }
//
//   @override
//  void dizAlo() {
//    print("Alo, sou Brasileiro");
//
//  }
//
//}
//class Bonni extends Pessoa {
//  String profissao;
//  @override
//  void dizAlo() {
//    print("Hello, I'm american!");
//  }
//
//
//}
//
//class Programador extends Pessoa {
//    bool sabeDart;
//    String tipoLinguagem;
//
//    Programador(this.sabeDart, this.tipoLinguagem);
//
//    void printTudo() {
//       print("O $nome $apelido sabe linguage $tipoLinguagem e tem $idade anos.");
//    }
//
//
//}

