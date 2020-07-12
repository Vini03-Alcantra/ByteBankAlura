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
  
  


