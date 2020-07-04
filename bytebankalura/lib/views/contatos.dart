import 'package:bytebankalura/views/contact_form.dart';
import 'package:flutter/material.dart';

class ContatosLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos Lista"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                "Alex",
                style: TextStyle(  
                  fontSize: 24
                )
              ),
              subtitle: Text(
                '1000',
                style: TextStyle(  
                  fontSize: 16
                ),
              ),
            )
          )
        ],
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