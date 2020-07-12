import 'package:bytebankalura/models/contato.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  //função join cria o banco no local esperado (caminho, nome_do_banco)
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(path, onCreate: (db, version){
         db.execute(
        'CREATE TABLE contatos( '
          'id INTEGER PRIMARY KEY, ' 
          'nome TEXT, '
          'numero_conta INTEGER) '
        );        
      }, version: 1,
  );
}
  
  


Future<int> save(Contato contato) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contatoMap = Map();    
    contatoMap['nome'] = contato.name;
    contatoMap['numero_conta'] = contato.numeroConta;
    return db.insert('contatos', contatoMap);
  
}

Future<List<Contato>> findAll(){
 return getDatabase().then((db){
    return db.query('contatos').then((maps){
      final List<Contato> contatos = List();
      for (Map<String, dynamic> map in maps) {
        final Contato contato = Contato(map['id'], map['nome'], map['numero_conta']);

        contatos.add(contato);
      }
      return contatos;
    });
  }); 
}