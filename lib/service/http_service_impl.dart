import 'package:dio/dio.dart';
import 'package:my_flutter_project/common/constants.dart';
import 'package:my_flutter_project/service/http_service.dart';

class HttpServiceImpl implements HttpService {

  late Dio _dio;
  
  @override
  Future<Response> getRequest(String url) async {
    
    Response response;

    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors() {

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: ((e, handler) => handler.next(e)),
        onRequest: ((options, handler) => handler.next(options)),
        onResponse: ((response, handler) => handler.next(response))
      )
    );
  }

  @override
  void init() {
    
    _dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: {"X-Api-Key": Constants.apiKey},
        receiveDataWhenStatusError: true,
        connectTimeout: 60*1000,
        receiveTimeout: 60*1000
      )
    );

    initializeInterceptors();
  }
}