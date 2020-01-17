class Pessao {
   String nome;
   Pessao(this.nome);

}

main(List<String> arguments) {

  var gaspar = new Pessao("Gaspar");
  var aleandro = new Pessao("Aleandro");
  var leandro = new Pessao("Leandro");
  var gina = new Pessao("Gina");

  var lista = [7, 34, 1, 0, 90, 45, 10]; //tamanho/comprimento = 7
  var soLista = new List<String>();
  soLista.add("Jaime");
  soLista.add("Bond");
  soLista.add("Gaspar");

  var listaDePessoas = new List<Pessao>();
  listaDePessoas.add(aleandro);
  listaDePessoas.add(leandro);
  listaDePessoas.add(gina);
  listaDePessoas.add(gaspar);


  for (int i = 0; i < listaDePessoas.length; i++) {
     print("Lista de nomes ${listaDePessoas[i].nome}");
  }

  //print(lista[2]);
//  print(lista.length);
//  print(lista[lista.length - 1]); //Vai dar o ultimo indice da nossa lista
//  for (var i = 0; i < lista.length; i++) {
//    print("Indice $i contem ${lista[i]}");
//
//  }
}
