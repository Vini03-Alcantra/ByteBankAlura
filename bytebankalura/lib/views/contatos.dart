import 'package:bytebankalura/database/app_database.dart';
import 'package:bytebankalura/database/dao/contact_dao.dart';
import 'package:bytebankalura/models/contato.dart';
import 'package:bytebankalura/views/contact_form.dart';
import 'package:flutter/material.dart';

class ContatosLista extends StatefulWidget {
  @override
  _ContatosListaState createState() => _ContatosListaState();
}

class _ContatosListaState extends State<ContatosLista> {  
  final List<Contato> contatos = List();
  final ContactDao _dao = ContactDao();
  @override
  Widget build(BuildContext context) {      
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer"),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: List(),
        future: _dao.findAll(),
        builder: (context, snapshot){
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            final List<Contato> contatos = snapshot.data;
            return ListView.builder(
              itemCount: contatos.length,
              itemBuilder: (BuildContext context, int index) {  
                final Contato contato = contatos[index];
                return ContatoItem(contato);
              },        
            );
          }
          
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactForm()));          
        },
        child: Icon(
          Icons.add
        ),
      ),
    );
  }
}

class ContatoItem extends StatelessWidget {
  final Contato contato;
  ContatoItem(this.contato);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.name,
          style: TextStyle(  
            fontSize: 24
          )
        ),
        subtitle: Text(
          contato.numeroConta.toString(),
          style: TextStyle(  
            fontSize: 16
          ),
        ),
      )
    );
  }
}