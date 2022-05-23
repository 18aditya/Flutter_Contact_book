import 'package:dio/dio.dart';

enum DioAction {
  get,
  post,
  put,
  delete,
}

class ApiProvider {
  final String bearerToken =
      'Bearer b3717640ec422524782fb59e6e8c872b4e08c6eba386f36d25cc3f5c568f7033';
  final String baseUrl = 'https://gorest.co.in/public/v2/users';
  final Dio _dio = Dio();

  ApiProvider() {
    _dio.interceptors.add(
      LogInterceptor(),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          // Do something before request is sent

          options.headers = {
            'Content-Type': 'application/json; charset=utf-8',
            'Authorization': bearerToken,
            'Cookie': 'Cookie_1=value',
          };

          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        // onResponse: (Response response, ResponseInterceptorHandler handler) {
        //   // Do something with response data
        //   // print('dio success');
        //   return handler.next(response); // continue
        // },
        onError: (DioError e, ErrorInterceptorHandler handler) async {
          print("check API Provider Error: $e");
          throw e;
        },
      ),
    );
  }

  Future<dynamic> use({
    required DioAction action,
    bool enableLanguageParam = true,
    dynamic body,
    dynamic data,
  }) async {
    final String finalUrl = baseUrl;
    late Response response;
    try {
      switch (action) {
        case DioAction.get:
          response = await _dio.get(
            finalUrl,
          );
          break;
        case DioAction.post:
          response = await _dio.post(
            finalUrl,
            data: data,
          );
          break;
        case DioAction.put:
          var delete = '$finalUrl/$data';
          response = await _dio.put(
            delete,
            data: body,
          );
          break;
        case DioAction.delete:
          var delete = '$finalUrl/$data';
          response = await _dio.delete(delete);
          break;
      }

      return response;
    } catch (e) {
      if (e is DioError) {
        print('cek api provider error message : ${e.response?.data}');
      }
    }
  }
}
