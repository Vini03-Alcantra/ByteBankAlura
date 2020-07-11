import 'package:bytebankalura/models/contato.dart';
import 'package:flutter/material.dart';
import 'package:bytebankalura/database/app_database.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Contato")
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(  
                labelText: "Seu Nome"
              ),
              style: TextStyle(
                fontSize: 24.0
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(  
                  labelText: "Número da Conta"
                ),
                style: TextStyle(              
                  fontSize: 24.0
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text("Criar"),
                  onPressed: (){
                    final String name = _nameController.text;
                    debugPrint(name);
                    final int numeroConta = int.tryParse(_accountNumberController.text);
                    debugPrint(numeroConta.toString());
                    final Contato contato = Contato(0, name, numeroConta);
                    save(contato);
                    Navigator.pop(context, contato);
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}