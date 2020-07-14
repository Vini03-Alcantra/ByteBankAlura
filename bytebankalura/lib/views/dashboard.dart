import 'package:bytebankalura/views/contatos.dart';
import 'package:bytebankalura/views/transactions_list.dart';
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
          Row(
            children: <Widget>[
              _FeatureItem(nome: "Transfer", icone: Icons.monetization_on, onClick: _showContatosLista,),
              _FeatureItem(nome: "linha de Transação", icone: Icons.description, onClick: () => _showtransactionsList(context))
            ],
          )
          
        ],
      ),
    );
  }

  void _showContatosLista(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ContatosLista())
    );
  }

  void _showtransactionsList(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TransactionsList())
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String nome;
  final IconData icone;
  final Function onClick;
  const _FeatureItem({Key key, this.nome, this.icone, @required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.green[500],
        child: InkWell(
          onTap: () => onClick(),
          child: Container(  
            padding: EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(padding: const EdgeInsets.all(8.0)),
                Icon(icone),
                Text(nome)
              ],
            ),
          ),
        ),
      ),
    );
  }
}