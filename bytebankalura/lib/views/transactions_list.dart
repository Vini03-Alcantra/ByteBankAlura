import 'package:bytebankalura/components/centered_message.dart';
import 'package:bytebankalura/http/webclient.dart';
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
            return CenteredMessage(message: "Aguarde enaqunto procuramos",);
          }else if(snapshot.hasError){
            return CenteredMessage(message: "URL Indisponível", icon: Icons.error_outline,);
          }else{
            final List<Transaction> transactions = snapshot.data;          
            if (transactions.isEmpty) {              
              return CenteredMessage(message: "Transações não encontradas", icon: Icons.warning,);
            } else {                          
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
              }
            );          
          }
          }
        }
      )
    );
  }          
}    