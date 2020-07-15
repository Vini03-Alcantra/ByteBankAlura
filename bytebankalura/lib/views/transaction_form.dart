import 'package:bytebankalura/http/webclient.dart';
import 'package:bytebankalura/models/contato.dart';
import 'package:bytebankalura/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Contato contato;

  const TransactionForm({Key key, this.contato}) : super(key: key);
  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Nova transação"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.contato.name,
                style: TextStyle(
                  fontSize: 24
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  widget.contato.numeroConta.toString(),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(labelText: "Value"),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                    child: Text("Transfer"),
                    onPressed: (){
                      final double value = double.tryParse(_valueController.text);
                      final transactionCreated = Transaction(value: value, contato: widget.contato);
                      save(transactionCreated).then((transaction){
                        if (transaction != null) {
                          Navigator.pop(context);   
                        }
                      });
                    }
                  ),
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}