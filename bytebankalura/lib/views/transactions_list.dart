import 'package:bytebankalura/http/webclient.dart';
import 'package:bytebankalura/models/contato.dart';
import 'package:bytebankalura/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions"),
      ),
      body: FutureBuilder<List<Transaction>>(  
        future: findAll(),
        builder: (context, snapshot){
          if(snapshot.data == null){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError){
            return Center(child: Text("Deu erro"));
          }else{
            final List<Transaction> transactions = snapshot.data;          
          return ListView.builder(
            itemBuilder: (context, index){
              final Transaction transaction = transactions[index];
              return Card(
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text(transaction.value.toString(), 
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  subtitle: Text(
                    transaction.contato.numeroConta.toString(),
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                ),
              );
        },
        itemCount: transactions.length,
        );
          }          
        }
      )
    );
  }
}
