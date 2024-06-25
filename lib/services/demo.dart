import 'package:dio/dio.dart' as DIO;

class ApiServices {
  final DIO.Dio _dio = DIO.Dio();



  ApiServices() {
    _dio.options.baseUrl = 'https://sanjay-tiwari-backend.vercel.app/api/';  // अपना बेस URL यहाँ डालें
    _dio.options.connectTimeout = Duration(seconds: 10);
    _dio.options.receiveTimeout = Duration(seconds: 10);
    _dio.interceptors.add(DIO.LogInterceptor(responseBody: true));
    _dio.options.validateStatus = (status) {
      return status! >= 200 && status < 500; // Define the range of status codes you want to handle
    };// Debugging के लिए
  }

  Future<DIO.Response> postData(String url, Map<String, dynamic> body) async {

    DIO.FormData formData = DIO.FormData.fromMap(body);
    try {
      final response = await _dio.post(url, data: formData,options: new DIO.Options(headers: {"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtb2JpbGUiOiIxMjM0NTY3ODkwIiwiaWF0IjoxNzE4OTU0NjE1LCJleHAiOjE3MTkwNDEwMTV9.8mzOg_CbAZCdOVlHkLoPBVcwriPtbjRw87WLnlGQYY0"})).timeout(Duration(seconds: 30));
      return _handleResponse(response);
    } on DIO.DioError catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<DIO.Response> getData(String url) async {
    try {
      final response = await _dio.get(url).timeout(Duration(seconds: 30));
      return response;
    } on DIO.DioError catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<DIO.Response> putData(String url, Map<String, dynamic> body) async {
    DIO.FormData formData = DIO.FormData.fromMap(body);
    try {
      final response = await _dio.put(url, data: formData).timeout(Duration(seconds: 30));
      return response;
    } on DIO.DioError catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<DIO.Response> deleteData(String url) async {
    try {
      final response = await _dio.delete(url).timeout(Duration(seconds: 30));
      return response;
    } on DIO.DioError catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  DIO.Response<dynamic> _handleError(DIO.DioError error) {
    String errorDescription = '';
    switch (error.type) {
      case DIO.DioErrorType.cancel:
        errorDescription = 'Request to API server was cancelled';
        break;
      case DIO.DioErrorType.connectionTimeout:
        errorDescription = 'Connection timeout with API server';
        break;
      case DIO.DioErrorType.receiveTimeout:
        errorDescription = 'Receive timeout in connection with API server';
        break;
      case DIO.DioErrorType.sendTimeout:
        errorDescription = 'Send timeout in connection with API server';
        break;
      case DIO.DioErrorType.badResponse:
        final response = error.response;
        if (response != null) {
          // Handle specific status codes here
          if (response.statusCode == 404) {
            print('Response body: ${response.data}');
            return response; // Return the response for further handling
          } else {
            errorDescription = 'Received invalid status code: ${response.statusCode}';
          }
        } else {
          errorDescription = 'Response is null';
        }
        break;
      case DIO.DioErrorType.unknown:
        errorDescription = 'Unexpected error occurred';
        break;
      default:
        errorDescription = 'Unhandled error';
        break;
    }
    print('Error description: $errorDescription');
    throw error;
  }

  DIO.Response<dynamic> _handleResponse(DIO.Response<dynamic> response) {
    return response;
  }
}
