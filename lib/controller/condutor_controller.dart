import 'dart:convert';

import 'package:http/http.dart' as http;

Future<bool> check_cod_condutor(String codigo) async {
  print(codigo);
  try {
    //var uri = Uri(scheme: 'http', host: '192.168.56.1', path: '/api/condutor/check', port: 80, queryParameters: {'user_cod': codigo});
    var url = Uri.http('192.168.56.1', 'multas_api/api/condutor/check', {'codigo': codigo});
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {

       var responseBody = jsonDecode(response.body);
       print(responseBody);
       final data = jsonDecode(response.body);
       if(data["existe"] == true){
         print(true);
          return true;
       }else{return false;}
    } else {

      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    // Exception occurred during HTTP request
    print('Error during HTTP request: $e');
  }
  return false;
}


Future<List?> get_info_condutor(String codigo) async {
  late Map<String, dynamic>? data;
  try {
    var url = Uri.http('192.168.56.1', '/multas_api/api/condutor/$codigo', {'codigo': codigo});
    var response = await http.get(url);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      data = jsonDecode(response.body) as Map<String, dynamic>?;
      print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
      print(data!["response"]);
      return data!["response"] as List<dynamic>?;
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    // Exception occurred during HTTP request
    print('Error during HTTP request: $e');
    return null;
  }
}
