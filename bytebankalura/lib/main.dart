import 'package:bytebankalura/http/webclient.dart';
import 'package:bytebankalura/models/contato.dart';
import 'package:bytebankalura/models/transaction.dart';
import 'package:bytebankalura/views/home.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home()
  )
  );
  save(Transaction(value: 200.0, contato: Contato(0, "Adriano", 2000)));
}