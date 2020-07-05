import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
void createDatabase(){
  getDatabasesPath().then((dbPath){
    final String path = join(dbPath, 'bytebank.db');
    openDatabase(path, onCreate: (db, version){
      db.execute(
        'CREATE TABLE contatos('
          'id INTEGER PRIMARY KEY,' 
          'nome TEXT,'
          'numero_conta INTEGER)'
        );        
      }, version: 1
    );
   });
}