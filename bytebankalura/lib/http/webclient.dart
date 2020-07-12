import 'package:flutter/material.dart';

import 'package:http/http.dart';

void findAll() async {
  final Response response = await get('http://localhost:8080/transactions');
}