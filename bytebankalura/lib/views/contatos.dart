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
        onPressed: (){},
        child: Icon(
          Icons.add
        ),
      ),
    );
  }
}