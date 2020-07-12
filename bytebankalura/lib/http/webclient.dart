import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:bytebankalura/models/transaction.dart';
import 'package:bytebankalura/models/contato.dart';
class LoggingInterceptor implements InterceptorContract{
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print(data);
    return data;
  }

  @override 
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print(data);
    return data;
  }
}


Future<List<Transaction>> findAll() async {
  final Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client.get('http://192.168.0.13:8080/transactions');
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