class Contato{
  final int id;
  final String name;
  final int numeroConta;

  Contato(this.id, this.name, this.numeroConta);

  // Contato.fromMap(Map<String, dynamic> json){
  //   return Contato(
  //     id: json['id'],
  //     name: json['name'],
  //     numeroConta: json['numeroConta']
  //   );
  // }
  

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      'numeroConta': numeroConta
    };
  }
}