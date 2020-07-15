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
Future<List<Transaction>> findAll() async {  
  final Response response = await client.get(baseUrl).timeout(Duration(seconds: 7));
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = List();
  for (Map<String, dynamic> element in decodedJson) {
    final Transaction transaction = Transaction(      
      value: element['value'],
      contato: Contato(0, element['contact']['name'], element['contact']['accountNumber'])
    );
    print('decoded Json $decodedJson');
    transactions.add(transaction);
  }

  return transactions;
}

Future<Transaction> save(Transaction transactio) async{
  final Map<String, dynamic> transactionMap = {
    'value': transactio.value,
    'contact': {
      'name': transactio.contato.name,
      'accountNumber': transactio.contato.numeroConta
    }
  };
  final String transactionJson = jsonEncode(transactionMap);

  final Response response = await client.post(baseUrl, headers: {
    'Content-type': 'application/json',
    'password': '1000'
  }, body: transactionJson);

  Map<String, dynamic> json = jsonDecode(response.body);
  final Map<String, dynamic> contactJson = json['contact'];
  final Transaction transaction = Transaction(
    value: json['value'],
    contato: Contato(0, contactJson['name'], contactJson['accountNumber'])
  );
  return transaction;
}