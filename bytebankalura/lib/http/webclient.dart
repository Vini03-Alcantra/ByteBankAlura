import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:bytebankalura/models/transaction.dart';
import 'package:bytebankalura/models/contato.dart';
import 'package:bytebankalura/http/interceptors/logging_interceptors.dart';
final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()]
);

const baseUrl = 'http://192.168.0.13:8080/transactions';
