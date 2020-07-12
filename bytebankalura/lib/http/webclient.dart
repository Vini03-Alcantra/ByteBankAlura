import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart';

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


void findAll() async {
  final Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  final Response response = await get('http://localhost:8080/transactions');
}