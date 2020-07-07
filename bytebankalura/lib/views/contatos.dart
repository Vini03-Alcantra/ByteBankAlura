import 'package:bytebankalura/models/contato.dart';
import 'package:bytebankalura/views/contact_form.dart';
import 'package:flutter/material.dart';

class ContatosLista extends StatelessWidget {
  final List<Contato> contatos = List();

  @override
  Widget build(BuildContext context) {
    contatos.add(Contato(0, "Jubão", 1000));
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos Lista"),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (BuildContext context, int index) {  
          final Contato contato = contatos[index];
          return ContatoItem(contato);
        },        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ContactForm()))
          .then((res){
            debugPrint(res.toString());
          });
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