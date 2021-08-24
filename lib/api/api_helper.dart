import 'package:dio/dio.dart';

class ApiHelper{
    ApiHelper._pvtCons();

    static ApiHelper INSTANCE = ApiHelper._pvtCons();

    final _jotaro = Dio(BaseOptions(
      baseUrl: 'http://10.10.50.130:3007/v1',
    ));

    Future<dynamic> postData(String path, Map<String, dynamic> data)async{
      try {
        Response response = await _jotaro.post(path, data: data);
        if(response.statusCode == 200 || response.statusCode == 201){
          return response.data;
        }else{
          throw Exception('Error loading the post');
        }
      } catch (e) {
          throw Exception('Could not connect');
      }
    }

    Future<dynamic> getData(String path,{Map<String, dynamic>? queryParam})async{
      try {
        Response response = await _jotaro.get(path, queryParameters: queryParam);
        if(response.statusCode == 200 || response.statusCode == 201){
          return response.data;
        }else{
          throw Exception('Error loading the get');
        }
      } catch (e) {
          throw Exception('Could not connect');
      }
    }
}