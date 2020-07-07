import 'package:bytebankalura/views/contatos.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bytebank"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('imagens/bytebank_logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.green[500],
              child: InkWell(
                onTap: (){
                  return Navigator.push(context, MaterialPageRoute(builder: (context) => ContatosLista()));
                },
                child: Container(  
                  padding: EdgeInsets.all(8.0),
                  height: 100,
                  width: 150,
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.people, color: Colors.white, size: 26,),
                      Text("Contatos", 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0
                      ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}