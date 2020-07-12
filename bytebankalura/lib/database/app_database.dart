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

Future<List<Contato>> findAll() async{
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query("contatos");
  final List<Contato> contatos = List();
  for (Map<String, dynamic> row in result) {
    final Contato contato = Contato(row['id'], row['nome'], row['numero_conta']);
    contatos.add(contato);
  }
  return contatos;    
}