
abstract class Animal {
  void respirar(); // metodo abstrato
 void fazBarulho() {
     print("Fazendo barulho...");
 }
}

class Humorista extends Pessoa implements Engracado {
  Humorista(String nome, String nacionalidade) : super(nome, nacionalidade);

  @override
  void fazerRir() {
     print("Humorista muito engracado!");
  }



}

abstract class Engracado {
  void fazerRir();

}
class Pessoa implements Animal {
  String nome, nacionalidade;


  Pessoa(this.nome, this.nacionalidade);

  @override
  void respirar() {
     print("Respirando como um ser humano!");
  }

  @override
  void fazBarulho() {
     print("Fazendo barulho como um ser humano!");
  }

}


main(List<String> arguments) {
  var pessoa = new Pessoa("Paulo", "Mocambicana");
 // pessoa.respirar();
  //pessoa.fazBarulho();

  var grandeHumorista = new Humorista("Jose", "Sueco");
  grandeHumorista.fazBarulho();
  grandeHumorista.respirar();
  grandeHumorista.fazerRir();



}
