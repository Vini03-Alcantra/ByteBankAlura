import 'package:bytebankalura/http/webclient.dart';
import 'package:bytebankalura/views/home.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home()
  )
  );

  findAll().then((value) => print("Transações ${value.toString()}"));
}